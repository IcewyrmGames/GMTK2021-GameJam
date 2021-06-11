using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum SettlementState {
	Locked,
	Available,
	Completed,
	MAX
}

public struct StateColor {
	public Color unhovered;
	public Color hovered;
}

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

	[EnumNamedArray(typeof(SettlementState))]
	[SerializeField] StateColor[] stateColors = new StateColor[(int)SettlementState.MAX];

	SpriteRenderer sprite;

	SettlementState state;
	bool hovered = false;

	void Start() {
		sprite = GetComponent<SpriteRenderer>();

		UpdateState(initialState, false);

		IceWyrm.StoryReader reader = IceWyrm.StoryReader.instance;
		reader.ObserveVariable(linkedVariable, OnVariableChanged);
	}

	void OnMouseEnter() {
		UpdateState(state, true);
	}

	void OnMouseExit() {
		UpdateState(state, false);
	}

	void OnMouseDown() {
		if (state == SettlementState.Available) {
			IceWyrm.StoryReader.instance.JumpToStitch(linkedStitch);
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
		state = newState;
		hovered = newHovered;

		if (hovered) {
			sprite.color = stateColors[(int)state].hovered;
		} else {
			sprite.color = stateColors[(int)state].unhovered;
		}

		if (newState == SettlementState.Completed) {
			if (leadingRailway) leadingRailway.ShowState(SettlementState.Completed);

			foreach (ConnectedSettlement connected in connections) {
				connected.railway.ShowState(SettlementState.Available);
				connected.settlement.MakeAvailable();
			}
		}
	}
}
