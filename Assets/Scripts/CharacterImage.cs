using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Image))]
public class CharacterImage : MonoBehaviour {
    Image image;

    static public CharacterImage instance;

    void Awake() {
        image = GetComponent<Image>();
    }

    void OnEnable() {
        instance = this;
    }
    void OnDisable() {
        instance = null;
    }

    public void SetCharacter(Sprite sprite) {
        image.sprite = sprite;

        if (image.sprite == null) {
            image.color = new Color(0,0,0,0);
        } else {
            image.color = Color.white;
        }
    }
}
