import 'package:dokan/app/config/prefs.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  // auth check
  static check() async {
    return await Prefs.get(key: 'is_login') == '' ? false : true;
  }

  // auth info
  static logout() async {
    await Prefs.clear();
    Get.offAllNamed('/signin');
  }

  // get fcm token
  static getJwtToken() async {
    return await Prefs.get(key: 'jwtToken');
  }

  // fcm token set
  static setJwtToken({required String token}) async {
    return await Prefs.set(
      key: 'jwtToken',
      value: token,
    );
  }

  // fcm token destroy
  static destroyJwtToken() async {
    return await Prefs.remove(key: 'jwtToken');
  }
}
