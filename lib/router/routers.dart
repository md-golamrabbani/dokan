import 'package:dokan/app/bindings/home_binding.dart';
import 'package:dokan/app/middleware/auth_middleware.dart';
import 'package:dokan/screens/auth/login_screen.dart';
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
      name: '/login',
      page: () => const LoginScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterScreen(),
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
