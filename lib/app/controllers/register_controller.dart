import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dokan/app/config/prefs.dart';
import 'package:dokan/app/config/url.dart';
import 'package:dokan/router/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class RegisterController extends GetxController {
  static final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>(
    debugLabel: 'registerFormKey',
  );
  static final TextEditingController userName = TextEditingController();
  static final TextEditingController userEmail = TextEditingController();
  static final TextEditingController userPassword = TextEditingController();
  static final TextEditingController userPasswordConfirm =
      TextEditingController();

  @override
  void onClose() {
    userName.dispose();
    userEmail.dispose();
    userPassword.dispose();
    userPasswordConfirm.dispose();
    super.onClose();
  }

  static String? userNameValidator(String value) {
    if (value.isEmpty) {
      return 'Username field is required!';
    }
    return null;
  }

  static String? emailValidator(String value) {
    // Regular expression for email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value.isEmpty) {
      return 'Email field is required!';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address!';
    }
    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Password field is required!';
    }
    return null;
  }

  static String? passwordValidator2(String value) {
    if (value.isEmpty) {
      return 'Confirm password field is required!';
    } else if (value != userPassword.text) {
      return 'Password not match!';
    }
    return null;
  }

  static void submit() async {
    final isValid = registerFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      registerFormKey.currentState!.save();
      try {
        Response response = await API.post(
          URL.register,
          data: jsonEncode({
            "username": userName.text,
            "email": userEmail.text,
            "password": userPassword.text,
          }),
        );
        if (response.statusCode == 200) {
          Prefs.set(key: 'is_login', value: '1');
          Get.offAllNamed('/home');
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }
}
