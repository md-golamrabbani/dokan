import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>(
    debugLabel: 'signInFormKey',
  );
  static final TextEditingController userMobileNumber = TextEditingController();
  static final TextEditingController userPassword = TextEditingController();
  static RxBool isRememberMe = false.obs;

  @override
  void onClose() {
    userMobileNumber.dispose();
    userPassword.dispose();
    super.onClose();
  }

  static String? phoneNumberValidator(String value) {
    final newValue = value.replaceAll(' ', '');
    if (value.isEmpty || newValue.length < 11 || newValue.length > 11) {
      return 'Mobile number must be 11 digit!';
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

  static void submit() async {
    final isValid = signInFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      signInFormKey.currentState!.save();
    }
  }
}
