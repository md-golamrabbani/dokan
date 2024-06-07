import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class Constant {
  static const String primaryFont = 'Ubuntu';
  static const String pingURL = 'https://example.com/';
  // image picker
  static const int imageQuality = 50;
  static const double avatarMaxWidth = 112;
  static const double avatarMaxHeight = 112;
  // form validation
  static const int maxPassword = 16;
  static const int minPassword = 6;
  static const int maxCharater = 120;
  static const int minCharater = 3;
  static const int phoneNumberLength = 11;

  // theme gradient
  static BoxDecoration inputFormBoxDecoration = const BoxDecoration(boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 10,
      spreadRadius: -5,
      offset: Offset(0, 5),
    ),
  ]);

  // theme gradient
  static BoxDecoration themeBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(Dimensions.circleSize),
    gradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        RGB.gradientTop,
        RGB.gradientBottom,
      ],
      stops: [-0.456, 1.0],
    ),
    boxShadow: const [
      BoxShadow(
        color: RGB.shadow,
        offset: Offset(0, 6),
        blurRadius: Dimensions.defaultSize,
      ),
    ],
  );
}
