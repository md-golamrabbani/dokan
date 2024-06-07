import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final prodoctList = [].obs;
  final isProductLoaded = false.obs;
  static final selectedPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    productLoad();
  }

  @override
  void onClose() {
    isProductLoaded.value = false;
    selectedPage.value = 0;
    super.onClose();
  }

  // tab page update
  static void pageUpdate({required int index}) {
    selectedPage.value = index;
  }

// load products
  void productLoad() async {
    final String response =
        await rootBundle.loadString('assets/json/data.json');
    prodoctList.value = await jsonDecode(response);
    isProductLoaded.value = true;
    update();
  }
}
