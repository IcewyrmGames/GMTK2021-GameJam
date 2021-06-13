using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public enum SettlementState {
	Locked,
	Available,
	Completed,
	MAX
}

[System.Serializable]
public struct StateColor {
	public Color unhovered;
	public Color hovered;
}

[System.Serializable]
public struct ConnectedSettlement {
	public Settlement settlement;
	public Railway railway;
}

[RequireComponent(typeof(SpriteRenderer))]
public class Settlement : MonoBehaviour {
	//The railway that leads to this settlement
	[SerializeField] Railway leadingRailway;
	//The connections to other settlements from this settlement
	[SerializeField] ConnectedSettlement[] connections;

	[SerializeField] string linkedStitch;
	[SerializeField] string linkedVariable;
	[SerializeField] Sprite characterSprite;

	[SerializeField] SettlementState initialState;

	//[EnumNamedArray(typeof(SettlementState))]
	[SerializeField] StateColor[] stateColors = new StateColor[(int)SettlementState.MAX];
	[SerializeField] float hoverScale = 1.6f;

	SpriteRenderer sprite;
	float originalScale = 1.0f;

	SettlementState state;
	bool hovered = false;

	SettlementState pendingState;

	void Awake() {
		sprite = GetComponent<SpriteRenderer>();
	}

	void Start() {
		originalScale = sprite.transform.localScale.x;

		//The true initial state is locked, so apply that here before applying the new initial state.
		if (initialState == SettlementState.Locked) {
			if (leadingRailway) leadingRailway.ShowState(SettlementState.Locked, SettlementState.Locked);
			sprite.color = stateColors[0].unhovered;
		}

		UpdateState(initialState, false);

		IceWyrm.StoryReader reader = IceWyrm.StoryReader.instance;
		reader.storyUpdated.AddListener(OnStoryUpdated);
		reader.storyEnded.AddListener(OnStoryEnded);

		if (reader.IsInitialized()) {
			OnStoryInitialized();
		} else {
			reader.storyInitialized.AddListener(OnStoryInitialized);
		}
	}

	void OnMouseEnter() {
		UpdateState(state, true);
		sprite.transform.DOScale(hoverScale, 0.2f);
	}

	void OnMouseExit() {
		UpdateState(state, false);
		sprite.transform.DOScale(originalScale, 0.2f);
	}

	void OnMouseDown() {
		if (enabled && state == SettlementState.Available && !string.IsNullOrEmpty(linkedStitch)) {
			IceWyrm.StoryReader.instance.JumpToStitch(linkedStitch);
			if (CharacterImage.instance) {
				CharacterImage.instance.SetCharacter(characterSprite);
			}
		}
	}

	void OnStoryInitialized() {
		IceWyrm.StoryReader reader = IceWyrm.StoryReader.instance;
		if (!string.IsNullOrEmpty(linkedVariable)) {
			reader.ObserveVariable(linkedVariable, OnVariableChanged);
		}
	}

	void OnStoryUpdated(IceWyrm.StoryView view) {
		enabled = false;
		UpdateState(state, false);
	}

	void OnStoryEnded() {
		enabled = true;
		if (pendingState != state) {
			UpdateState(pendingState, hovered);
		}
	}

	void OnVariableChanged(string variable, object newValue) {
		if (variable == linkedVariable) {
			bool newBoolValue = (bool)newValue;
			UpdateState(newBoolValue ? SettlementState.Completed : SettlementState.Locked, hovered, false);
		}
	}

	public void MakeAvailable() {
		UpdateState(SettlementState.Available, hovered);
	}

	void UpdateState(SettlementState newState, bool newHovered, bool immediate = true) {
		if (!enabled && !immediate && newState != state) {
			pendingState = newState;
			return;
		}

		hovered = newHovered;

		if (state != newState) {
			state = newState;
			pendingState = newState;

			Debug.Log(name + " State " + newState);

			if (newState == SettlementState.Completed) {
				sprite.transform.localScale = Vector3.one * originalScale;
				sprite.transform.DOPunchScale(Vector3.one, 0.5f, 2, 1.0f);

				if (leadingRailway) leadingRailway.ShowState(SettlementState.Available, SettlementState.Completed);

				foreach (ConnectedSettlement connection in connections) {
					if (connection.railway) connection.railway.ShowState(SettlementState.Locked, SettlementState.Available);
					if (connection.settlement) connection.settlement.MakeAvailable();
				}

			} else if (newState == SettlementState.Available) {
				sprite.transform.DOShakeRotation(0.5f, new Vector3(0,0,1), 2, 1.0f, true);
			}
		}

		//Always update color values
		if (hovered) {
			sprite.color = stateColors[(int)state].hovered;
		} else {
			sprite.color = stateColors[(int)state].unhovered;
		}
	}
}
