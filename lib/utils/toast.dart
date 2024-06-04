import 'package:dokan/utils/keys.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';

class Toast {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
      {required String title, required bool isError}) {
    return ScaffoldMessenger.of(Keys.navigator.currentContext!).showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: isError ? RGB.primary : RGB.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
