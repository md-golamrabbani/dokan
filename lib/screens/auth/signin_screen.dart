import 'package:dokan/app/controllers/auth_controller.dart';
import 'package:dokan/app/controllers/signin_controller.dart';
import 'package:dokan/utils/button.dart';
import 'package:dokan/utils/constant.dart';
import 'package:dokan/utils/dimensions.dart';
import 'package:dokan/utils/input.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              const SizedBox(
                height: Dimensions.avatarSize / 2,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  width: Get.width / 2.5,
                ),
              ),
              const SizedBox(
                height: Dimensions.avatarSize * 1.75,
              ),
              const Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Dimensions.lgSize * 1.5,
                  fontWeight: FontWeight.w700,
                  color: RGB.dark,
                ),
              ),
              const SizedBox(
                height: Dimensions.avatarSize,
              ),
              Obx(
                () => Form(
                  key: SignInController.signInFormKey,
                  child: Column(
                    children: [
                      // email
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: Dimensions.defaultSize * 1.5,
                        ),
                        decoration: Constant.inputFormBoxDecoration,
                        child: TextFormField(
                          controller: SignInController.userName,
                          validator: (value) {
                            return SignInController.userNameValidator(value!);
                          },
                          decoration: inputStyle(
                            isPrefixIconSvg: true,
                            prefixIcon: Icons.person,
                            svgPrefixIcon: 'assets/icons/user.svg',
                            hintText: 'Username',
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
                          controller: SignInController.userPassword,
                          validator: (value) {
                            return SignInController.passwordValidator(value!);
                          },
                          obscureText: AuthController.passwordVisibility.value,
                          decoration: inputStyle(
                            isPrefixIconSvg: true,
                            prefixIcon: Icons.person,
                            svgPrefixIcon: 'assets/icons/password.svg',
                            passwordVisibility:
                                AuthController.passwordVisibility.value,
                            suffixIcon: Icons.visibility_outlined,
                            suffixOnPressed: () {
                              AuthController.obscureText();
                            },
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
                      InkWell(
                        onTap: () {},
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Dimensions.avatarSize,
                      ),
                      ElevatedButton(
                        style: Button.primary,
                        onPressed: () {
                          SignInController.submit();
                        },
                        child: SizedBox(
                          width: Get.width,
                          child: const Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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

              TextButton(
                onPressed: () {
                  Get.offAndToNamed('/register');
                },
                child: const Text(
                  'Create New Account',
                  style: TextStyle(
                    color: RGB.dark,
                    fontSize: Dimensions.lgSize,
                  ),
                ),
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
