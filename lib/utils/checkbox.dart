import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class CheckBoxs {
  static show({
    required ValueChanged<bool?> onChanged,
    required String text,
    bool value = false,
  }) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.25,
          child: Checkbox(
            value: value,
            fillColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return RGB.pink;
              }
              return RGB.white;
            }),
            side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(
                width: 0,
                color: RGB.pink,
              ),
            ),
            checkColor: RGB.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimensions.radiusSize / 2,
              ),
            ),
            visualDensity: const VisualDensity(horizontal: -4.0, vertical: 0.0),
            onChanged: onChanged,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: Dimensions.defaultSize,
          ),
        ),
      ],
    );
  }
}
