using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class Railway : MonoBehaviour {
	LineRenderer line;

	[EnumNamedArray(typeof(SettlementState))]
	[SerializeField] Color[] stateColors = new Color[(int)SettlementState.MAX];

	void Awake() {
		line = GetComponent<LineRenderer>();
	}

	public void ShowState(SettlementState prevState, SettlementState newState) {
		line.DOColor(stateColors[(int)prevState], stateColors[(int)newState], 0.5f);
	}
}
