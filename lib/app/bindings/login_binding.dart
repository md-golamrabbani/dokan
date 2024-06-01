import 'package:dokan/app/controllers/auth_controller.dart';
import 'package:dokan/app/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => LoginController());
  }
}
