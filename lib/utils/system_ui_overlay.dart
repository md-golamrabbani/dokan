import 'dart:io';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/services.dart';

class SystemUIOverlay {
  // init system UI
  static initSystemUI() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: RGB.background,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: RGB.background,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  // theme => 0 mean light || 1 mean dark
  // top
  static updateStatusBar(dynamic bgColor, dynamic theme) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: bgColor,
          statusBarBrightness: theme == 0 ? Brightness.light : Brightness.dark,
          statusBarIconBrightness:
              theme == 0 ? Brightness.light : Brightness.dark,
          systemNavigationBarIconBrightness:
              theme == 0 ? Brightness.light : Brightness.dark,
        ),
      );
    }
  }

  // bottom
  static updateNavigationBar(dynamic bgColor, dynamic theme) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: bgColor,
          systemNavigationBarIconBrightness:
              theme == 0 ? Brightness.light : Brightness.dark,
          systemNavigationBarContrastEnforced: true,
          systemNavigationBarDividerColor: const Color(0x00000000),
        ),
      );
    }
  }
}
