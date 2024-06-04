import 'package:get/get.dart';

class AuthController extends GetxController {
  static RxBool passwordVisibility = true.obs;
  static RxBool confirmPasswordVisibility = true.obs;

  static void obscureText() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  static void obscure2Text() {
    confirmPasswordVisibility.value = !confirmPasswordVisibility.value;
  }
}
