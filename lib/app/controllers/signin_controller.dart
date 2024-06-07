import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dokan/app/config/prefs.dart';
import 'package:dokan/app/config/url.dart';
import 'package:dokan/router/api.dart';
import 'package:dokan/utils/debugger.dart';
import 'package:dokan/utils/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class SignInController extends GetxController {
  static final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>(
    debugLabel: 'signInFormKey',
  );
  static final TextEditingController userName = TextEditingController();
  static final TextEditingController userPassword = TextEditingController();
  static RxBool isRememberMe = false.obs;

  @override
  void onClose() {
    userName.dispose();
    userPassword.dispose();
    super.onClose();
  }

  static String? userNameValidator(String value) {
    if (value.isEmpty) {
      return 'Username field is required!';
    }
    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Password field is required!';
    }
    return null;
  }

  static void rememberMe() {
    isRememberMe.value = !isRememberMe.value;
  }

  static void resetForm() {
    signInFormKey.currentState?.reset();
    userName.clear();
    userPassword.clear();
  }

  static void submit() async {
    final isValid = signInFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      signInFormKey.currentState!.save();
      try {
        Response response = await API.post(
          URL.signIn,
          data: jsonEncode({
            "username": userName.text,
            "password": userPassword.text,
          }),
        );
        if (response.statusCode == 200) {
          SignInController.resetForm();
          Prefs.set(key: 'is_login', value: '1');
          Prefs.set(key: 'jwtToken', value: response.data['token']);
          Prefs.set(key: 'user', value: response.data);
          SnackBars.showSuccessSnackbar(
            text: 'Welcome back, ${response.data['user_display_name']}',
          );
          Get.offAllNamed('/home');
        }
      } catch (e) {
        Debugger.show(title: e.toString());
      }
    }
  }
}
