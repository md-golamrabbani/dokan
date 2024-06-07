import 'package:dokan/app/controllers/auth_controller.dart';
import 'package:dokan/app/controllers/signin_controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => SignInController());
  }
}
