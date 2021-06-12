using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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

	[SerializeField] SettlementState initialState;

	//[EnumNamedArray(typeof(SettlementState))]
	[SerializeField] StateColor[] stateColors = new StateColor[(int)SettlementState.MAX];

	SpriteRenderer sprite;

	SettlementState state;
	bool hovered = false;

	SettlementState pendingState;

	void Awake() {
		sprite = GetComponent<SpriteRenderer>();
	}

	void Start() {
		UpdateState(initialState, false);

		IceWyrm.StoryReader reader = IceWyrm.StoryReader.instance;
		if (!string.IsNullOrEmpty(linkedVariable)) {
			reader.ObserveVariable(linkedVariable, OnVariableChanged);
		}
		reader.storyUpdated.AddListener(OnStoryUpdated);
		reader.storyEnded.AddListener(OnStoryEnded);
	}

	void OnMouseEnter() {
		UpdateState(state, true);
	}

	void OnMouseExit() {
		UpdateState(state, false);
	}

	void OnMouseDown() {
		if (enabled && state == SettlementState.Available && !string.IsNullOrEmpty(linkedStitch)) {
			IceWyrm.StoryReader.instance.JumpToStitch(linkedStitch);
		}
	}

	void OnStoryUpdated(IceWyrm.StoryView view) {
		enabled = false;
	}

	void OnStoryEnded() {
		enabled = true;
		if (pendingState != state) {
			UpdateState(pendingState, hovered);
		}
	}

	void OnVariableChanged(string variable, object newValue) {
		bool newBoolValue = (bool)newValue;
		UpdateState(newBoolValue ? SettlementState.Completed : SettlementState.Locked, hovered);
	}

	public void MakeAvailable() {
		UpdateState(SettlementState.Available, hovered);
	}

	void UpdateState(SettlementState newState, bool newHovered) {
		if (!enabled) {
			pendingState = newState;
			return;
		}

		state = newState;
		hovered = newHovered;

		if (hovered) {
			sprite.color = stateColors[(int)state].hovered;
		} else {
			sprite.color = stateColors[(int)state].unhovered;
		}

		if (newState == SettlementState.Completed) {
			if (leadingRailway) leadingRailway.ShowState(SettlementState.Completed);

			foreach (ConnectedSettlement connection in connections) {
				if (connection.railway) connection.railway.ShowState(SettlementState.Available);
				if (connection.settlement) connection.settlement.MakeAvailable();
			}
		}
	}
}
