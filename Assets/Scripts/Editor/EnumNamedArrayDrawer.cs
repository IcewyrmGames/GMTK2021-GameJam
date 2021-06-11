using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[CustomPropertyDrawer(typeof(EnumNamedArrayAttribute))]
public class EnumNamedArrayDrawer : PropertyDrawer {
    public override void OnGUI(Rect position, SerializedProperty property, GUIContent label) {
        EnumNamedArrayAttribute namedArrayAttribute = attribute as EnumNamedArrayAttribute;

        int braceIndex = property.propertyPath.IndexOf("[");
        int index = System.Convert.ToInt32(property.propertyPath.Substring(braceIndex).Replace("[", "").Replace("]", ""));

        label.text = namedArrayAttribute.names[index];

        EditorGUI.PropertyField(position, property, label, true);
    }
}
