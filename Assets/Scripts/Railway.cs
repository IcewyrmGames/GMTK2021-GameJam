using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

[RequireComponent(typeof(LineRenderer))]
public class Railway : MonoBehaviour {
	LineRenderer line;

	[EnumNamedArray(typeof(SettlementState))]
	[SerializeField] Color[] stateColors = new Color[(int)SettlementState.MAX];

	void Awake() {
		line = GetComponent<LineRenderer>();
	}

	public void ShowState(SettlementState prevState, SettlementState newState) {
		Color prevColor = stateColors[(int)prevState];
		Color newColor = stateColors[(int)newState];
		line.DOColor(new Color2(prevColor, prevColor), new Color2(newColor, newColor), 0.5f);
	}
}
