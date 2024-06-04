import 'package:flutter/foundation.dart';

class Debugger {
  static void show({required dynamic title}) {
    if (kDebugMode) {
      print(
          "----------------------------------Debugger----------------------------------");
      print(title);
      print(
          "----------------------------------Debugger----------------------------------");
    }
  }
}
