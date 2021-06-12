using UnityEngine;
using UnityEngine.Events;
using Ink.Runtime;
using System.Collections.Generic;

namespace IceWyrm {
	[HotReloadInvokable]
	public class StoryReader : MonoBehaviour, ISerializationCallbackReceiver {
		static public StoryReader instance { get; private set; }

		//The compiled JSON text that describes the story
		[SerializeField] TextAsset compiledStory;

		//Should the story play automatically when starting?
		[SerializeField] bool playOnStart = true;
		//Should we use a maximal continue, which will add up all the text until the next option when we do a single step?
		[SerializeField] bool useMaximalContinue = false;

		//The story object that is executing the Ink story
		Story story;
		//The current choices, which are parsed from the story
		List<StoryChoice> choices = new List<StoryChoice>();
		//Whether the story is currently in progress, or has been ended
		public bool isInProgress { get; private set; }

		//Fired when the story is initialized
		public UnityEvent storyInitialized;
		//Fired when the story is updated in some way
		public StoryViewEvent storyUpdated;
		//Fired when the story reaches a point where there is nowhere left to go
		public UnityEvent storyEnded;

#if UNITY_EDITOR
		//Data used to hot-reload the story state when working in the editor
		[SerializeField, HideInInspector] string reloadStoryText;
		[SerializeField, HideInInspector] string reloadSerializedData;
#endif

		public void Start() {
			if (InitStory(compiledStory.text)) {
				if (playOnStart) {
					Continue();
				}

#if UNITY_EDITOR
				reloadStoryText = compiledStory.text;
#endif
			}
		}

		void OnEnable() {
			if (instance) {
				Debug.LogError("Multiple StoryReader components exist in the current scenes. They may interfere with each other.");
			}
			instance = this;
		}

		void OnDisable() {
			instance = null;
		}

		void ISerializationCallbackReceiver.OnBeforeSerialize() {
#if UNITY_EDITOR
			if (story != null) {
				reloadSerializedData = story.state.ToJson();
			} else {
				reloadSerializedData = null;
			}
#endif
		}

		void ISerializationCallbackReceiver.OnAfterDeserialize() {
#if UNITY_EDITOR
			if (InitStory(reloadStoryText)) {
				if (!string.IsNullOrEmpty(reloadSerializedData)) {
					story.state.LoadJson(reloadSerializedData);
				}
			}
#endif
		}

		void OnHotReload() {
			instance = this;
		}

		public bool IsInitialized() { return !!story; }

		public StoryView GetCurrentView() {
			if (story) {
				var (prefix, text) = ExtractPrefix(story.currentText);
				return new StoryView(prefix, text, story.currentTags, choices);
			} else {
				return default(StoryView);
			}
		}

		//Continue the current thread of the story. Broadcasts information about the new position in the story.
		public void Continue() {
			choices.Clear();

			//canContinue means we can generate more story text, so if that's the case we'll update with new text and tags but not choices
			if (story.canContinue) {
				isInProgress = true;

				if (useMaximalContinue) story.ContinueMaximally();
				else story.Continue();

				var (prefix, text) = ExtractPrefix(story.currentText);

				StoryView view = new StoryView(prefix, text, story.currentTags, choices);
				storyUpdated.Invoke(view);

			//If we can't continue but have choices, we're waiting to select a choice. This information won't change until a choice is actually selected.
			} else if (story.currentChoices.Count > 0) {
				isInProgress = true;

				//Collect minimal information about the choices we have right now
				foreach (Choice choice in story.currentChoices) {
					var (choicePrefix, choiceText) = ExtractPrefix(choice.text);
					choices.Add(new StoryChoice(choicePrefix, choiceText, choice.index));
				}

				var (prefix, text) = ExtractPrefix(story.currentText);
				StoryView view = new StoryView(prefix, text, story.currentTags, choices);
				storyUpdated.Invoke(view);

			//We can't continue and have no choices, so the story has reached the end of a branch.
			} else {
				isInProgress = false;
				storyEnded.Invoke();
			}
		}

		public void ChooseChoice(int index) {
			if (story.currentChoices.Count > 0) {
				story.ChooseChoiceIndex(index);
				Continue();
			} else {
				Debug.LogWarning("Attempted to choose choice while there are no current choices. Nothing will happen.");
			}
		}

		public void JumpToStitch(string stitch) {
			story.ChoosePathString(stitch);
			Continue();
		}

		public bool HasPlayedStitch(string stitch) {
			return story.state.VisitCountAtPathString(stitch) > 0;
		}

		public void ObserveVariable(string variable, Story.VariableObserver observer) {
			story.ObserveVariable(variable, observer);
		}

		public void RemoveObservers(string variable) {
			story.RemoveVariableObserver(null, variable);
		}

		public void RemoveObserver(Story.VariableObserver observer) {
			story.RemoveVariableObserver(observer, null);
		}

		public object GetVariable(string variable) {
			Ink.Runtime.Value value = story.variablesState.GetVariableWithName(variable) as Ink.Runtime.Value;
			if (value) return value.valueObject;
			else return null;
		}

		//Create a new story object for the compiled story, which will reset all state and progress.
		bool InitStory(string text) {
			if (!string.IsNullOrEmpty(text)) {
				story = new Story(text);
				story.onError += OnInkError;
				return true;
			}
			return false;
		}

		void OnInkError(string message, Ink.ErrorType type) {
			if (type == Ink.ErrorType.Warning) Debug.LogWarning(message);
			else Debug.LogError(message);
		}

		(string prefix, string text) ExtractPrefix(string original) {
			string[] sections = original.Split(new string[]{": "}, 2, System.StringSplitOptions.RemoveEmptyEntries);
			if (sections.Length == 2) {
				if (!sections[0].Contains(" ")) {
					return (sections[0], sections[1]);
				}
			}

			return (string.Empty, original);
		}
	}
}
