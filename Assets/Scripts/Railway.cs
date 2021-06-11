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

	public void ShowState(SettlementState state) {
		line.startColor = stateColors[(int)state];
		line.endColor = stateColors[(int)state];
	}
}
