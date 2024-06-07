import 'package:dokan/app/controllers/auth_controller.dart';
import 'package:dokan/app/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RegisterController());
  }
}
