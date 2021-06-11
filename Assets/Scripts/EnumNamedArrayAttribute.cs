using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Reflection;

public class EnumNamedArrayAttribute : PropertyAttribute
{
	public string[] names;

	public EnumNamedArrayAttribute(System.Type enumType) {
		this.names = System.Enum.GetNames(enumType);
	}
}
