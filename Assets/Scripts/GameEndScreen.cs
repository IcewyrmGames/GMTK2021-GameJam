using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameEndScreen : MonoBehaviour {
	[SerializeField] string[] variables;

	void Start() {
		IceWyrm.StoryReader.instance.storyEnded.AddListener(OnStoryEnded);
		gameObject.SetActive(false);
	}

	void OnStoryEnded() {
		IceWyrm.StoryReader reader = IceWyrm.StoryReader.instance;

		bool hasGameEnded = true;
		foreach (string variable in variables) {
			object value = reader.GetVariable(variable);
			if (value == null || !(bool)value) {
				hasGameEnded = false;
				break;
			}
		}

		if (hasGameEnded) {
			gameObject.SetActive(true);
		}
	}
}
