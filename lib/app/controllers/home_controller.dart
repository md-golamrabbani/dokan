import 'package:get/get.dart';

class HomeController extends GetxController {
  static final selectedPage = 0.obs;
  // tab page update
  static void pageUpdate({required int index}) {
    selectedPage.value = index;
  }
}
