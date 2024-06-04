import 'package:get/get.dart';

class ExceptionsHandler {
  // api error
  static apiErrorOccer(error) {
    // error snackbar
    Get.snackbar(
      'Error',
      error,
    );
  }
}
