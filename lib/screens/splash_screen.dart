import 'package:dokan/app/services/auth_service.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // splash animation
  late final AnimationController _lottieController =
      AnimationController(vsync: this);

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RGB.background,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/logo.svg'),
              Lottie.asset(
                'assets/json/loading.json',
                width: Get.width / 3,
                height: Get.width / 3,
                repeat: false,
                controller: _lottieController,
                onLoaded: (composition) {
                  _lottieController
                    ..duration = composition.duration
                    ..forward().whenComplete(() async {
                      // if (await AuthService.check()) {
                      Get.offAllNamed('/home');
                      // } else {
                      //   Get.offAllNamed('/login');
                      // }
                    });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
