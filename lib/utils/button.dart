import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class Button {
  static ButtonStyle light = ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith(
      (states) => RGB.white,
    ),
    foregroundColor: MaterialStateColor.resolveWith(
      (states) => RGB.secondary,
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(
        vertical: Dimensions.defaultSize * 1.5,
      ),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimensions.radiusSize,
        ),
      ),
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    elevation: MaterialStateProperty.all(0),
    side: MaterialStateProperty.all(
      const BorderSide(
        color: RGB.border,
        width: 1,
      ),
    ),
  );

  static ButtonStyle success = ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith(
      (states) => RGB.success,
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(
        vertical: Dimensions.defaultSize * 1.5,
      ),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimensions.radiusSize,
        ),
      ),
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    elevation: MaterialStateProperty.all(0),
  );
}
