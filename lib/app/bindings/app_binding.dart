import 'package:dokan/app/controllers/app_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), fenix: true);
  }
}
