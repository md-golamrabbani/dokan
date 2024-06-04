import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dokan/utils/constant.dart';
import 'package:dokan/utils/debugger.dart';
import 'package:dokan/utils/keys.dart';
import 'package:dokan/utils/snakbar.dart';

class ConnectivityServices {
  // late StreamSubscription subscription;
  static stream() {
    Connectivity().onConnectivityChanged.listen((result) {
      // Received changes in available connectivity types!
      Debugger.show(title: result.first);
      if (Keys.navigator.currentContext != null) {
        if (result.first == ConnectivityResult.none) {
          SnackBars.showErrorSnackbar(
            text: 'You are offline!',
          );
        } else {
          SnackBars.showSuccessSnackbar(
            text: 'You are Online!',
          );
        }
      }
    });
  }

  static Future<bool> check() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.first == ConnectivityResult.mobile) {
      // Mobile network available.
      return true;
    } else if (connectivityResult.first == ConnectivityResult.wifi) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      return true;
    } else if (connectivityResult.first == ConnectivityResult.vpn) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      return true;
    } else if (connectivityResult.first == ConnectivityResult.none) {
      // No available network types
      return false;
    }
    return isPing();
  }

  // url lookup
  static Future<bool> isPing() async {
    try {
      final result = await InternetAddress.lookup(Constant.pingURL);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      SnackBars.showErrorSnackbar(
        text: 'Ensure that you have a strong mobile signal!',
      );
      return false;
    }
  }
}
