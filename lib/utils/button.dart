import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class Button {
  // primary style
  static ButtonStyle primary = ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith(
      (states) => RGB.primary,
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

  // light style
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

  // light social style
  static ButtonStyle lightSocial = ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith(
      (states) => RGB.white,
    ),
    foregroundColor: MaterialStateColor.resolveWith(
      (states) => RGB.secondary,
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.all(0),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimensions.radiusSize,
        ),
      ),
    ),
    shadowColor: MaterialStateProperty.all(RGB.dark.withOpacity(0.25)),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    elevation: MaterialStateProperty.all(3),
    side: MaterialStateProperty.all(
      const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    ),
  );

  // success style
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
