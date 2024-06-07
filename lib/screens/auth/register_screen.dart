import 'package:dokan/utils/button.dart';
import 'package:dokan/utils/constant.dart';
import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/input.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RGB.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Dimensions.lgSize,
            horizontal: Dimensions.defaultSize * 2,
          ),
          child: ListView(
            children: [
              // avatar image picker
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: Dimensions.defaultSize,
                  ),
                  width: Dimensions.circleSize * 1.25,
                  height: Dimensions.circleSize * 1.25,
                  decoration: BoxDecoration(
                    color: RGB.white,
                    borderRadius: BorderRadius.circular(
                      Dimensions.circleSize,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: RGB.dark.withOpacity(0.1),
                        blurRadius: Dimensions.smSize - 5,
                        spreadRadius: 0,
                        offset: const Offset(0, Dimensions.tinySize - 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/user.svg',
                          width: Dimensions.lgSize * 2,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.tinySize),
                          decoration: Constant.themeBoxDecoration,
                          child: const Icon(
                            Icons.camera_alt,
                            color: RGB.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.avatarSize / 2,
              ),
              // name
              Container(
                margin: const EdgeInsets.only(
                  bottom: Dimensions.defaultSize * 1.5,
                ),
                decoration: Constant.inputFormBoxDecoration,
                child: TextFormField(
                  decoration: inputStyle(
                    isPrefixIconSvg: true,
                    prefixIcon: Icons.person,
                    svgPrefixIcon: 'assets/icons/user.svg',
                    hintText: 'Name',
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Dimensions.defaultSize * 1.25,
                      horizontal: Dimensions.defaultSize,
                    ),
                  ),
                ),
              ),
              // email
              Container(
                margin: const EdgeInsets.only(
                  bottom: Dimensions.defaultSize * 1.5,
                ),
                decoration: Constant.inputFormBoxDecoration,
                child: TextFormField(
                  decoration: inputStyle(
                    isPrefixIconSvg: true,
                    prefixIcon: Icons.person,
                    svgPrefixIcon: 'assets/icons/email.svg',
                    hintText: 'Email',
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Dimensions.defaultSize * 1.25,
                      horizontal: Dimensions.defaultSize,
                    ),
                  ),
                ),
              ),
              // password
              Container(
                margin: const EdgeInsets.only(
                  bottom: Dimensions.defaultSize * 1.5,
                ),
                decoration: Constant.inputFormBoxDecoration,
                child: TextFormField(
                  decoration: inputStyle(
                    isPrefixIconSvg: true,
                    prefixIcon: Icons.person,
                    svgPrefixIcon: 'assets/icons/password.svg',
                    hintText: 'Password',
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Dimensions.defaultSize * 1.25,
                      horizontal: Dimensions.defaultSize,
                    ),
                  ),
                ),
              ),
              // Confirm Password
              Container(
                margin: const EdgeInsets.only(
                  bottom: Dimensions.defaultSize * 1.5,
                ),
                decoration: Constant.inputFormBoxDecoration,
                child: TextFormField(
                  decoration: inputStyle(
                    isPrefixIconSvg: true,
                    prefixIcon: Icons.person,
                    svgPrefixIcon: 'assets/icons/password.svg',
                    hintText: 'Confirm Password',
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: Dimensions.defaultSize * 1.25,
                      horizontal: Dimensions.defaultSize,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.avatarSize / 2,
              ),
              ElevatedButton(
                style: Button.primary,
                onPressed: () {},
                child: const Text('Sign Up'),
              ),
              const SizedBox(
                height: Dimensions.avatarSize / 1.5,
              ),
              // social login
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimensions.defaultSize * 3.75,
                    height: Dimensions.defaultSize * 3.75,
                    child: ElevatedButton(
                      style: Button.lightSocial,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'assets/icons/facebook.svg',
                        width: 28,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Dimensions.defaultSize,
                  ),
                  SizedBox(
                    width: Dimensions.defaultSize * 3.75,
                    height: Dimensions.defaultSize * 3.75,
                    child: ElevatedButton(
                      style: Button.lightSocial,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'assets/icons/google.svg',
                        width: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.defaultSize * 2,
              ),
              // login page
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: RGB.secondary.withOpacity(0.75),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed('/login');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.defaultSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
