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
  );
}
