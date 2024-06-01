import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/keys.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Dialogs {
  // loadings
  static loading() {
    return showDialog(
      context: Keys.navigator.currentContext!,
      barrierDismissible: false,
      barrierColor: RGB.primary.withOpacity(0.85),
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(
                    Dimensions.smSize,
                  ),
                  decoration: BoxDecoration(
                    color: RGB.white,
                    borderRadius: BorderRadius.circular(
                      Dimensions.circleSize,
                    ),
                  ),
                  child: Lottie.asset(
                    'assets/json/loading.json',
                    width: Dimensions.avatarSize,
                    height: Dimensions.avatarSize,
                    repeat: true,
                  ),
                ),
              ),
              Positioned(
                child: Transform.scale(
                  scale: 2.5,
                  child: const CircularProgressIndicator(
                    strokeWidth: 1,
                    color: RGB.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
