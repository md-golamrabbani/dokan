import 'package:dokan/app/bindings/home_binding.dart';
import 'package:dokan/app/bindings/register_binding.dart';
import 'package:dokan/app/bindings/signin_binding.dart';
import 'package:dokan/app/middleware/auth_middleware.dart';
import 'package:dokan/screens/auth/signin_screen.dart';
import 'package:dokan/screens/auth/register_screen.dart';
import 'package:dokan/screens/home_screen.dart';
import 'package:dokan/screens/splash_screen.dart';
import 'package:get/get.dart';

class Routers {
  static final initRoute = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/signin',
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
  ];
}
