import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: RGB.primary,
    ),
    useMaterial3: false,
    scaffoldBackgroundColor: RGB.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: RGB.dark,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    ),
  );
}
