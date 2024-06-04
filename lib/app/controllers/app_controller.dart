import 'package:dokan/app/config/prefs.dart';
import 'package:dokan/utils/dialogs.dart';
import 'package:dokan/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static RxBool isLoading = false.obs;
  static RxBool isDarkMode = false.obs;

  // loader show
  static void loaderShow() {
    isLoading.value = !isLoading.value;
    Dialogs.loading();
  }

  // loader dismiss
  static void loaderDismiss() {
    isLoading.value = !isLoading.value;
    Navigator.of(Keys.navigator.currentContext!).pop();
  }

  // toggle theme
  static void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    saveTheme();
  }

  // save theme
  static void saveTheme() async {
    await Prefs.set(
      key: 'isDarkMode',
      value: isDarkMode.value,
    );
  }

  // load theme
  static void loadTheme() async {
    isDarkMode.value = await Prefs.get(key: 'isDarkMode') != '' ? true : false;
  }

  // theme mode
  static ThemeMode themeMode() {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }
}
