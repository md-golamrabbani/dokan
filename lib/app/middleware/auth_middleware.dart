import 'package:dokan/app/services/auth_service.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // Check if the user is logged in
    bool isLoggedIn = await AuthService.check();

    // If the user is not logged in and tries to access a protected route,
    // redirect them to the login page.
    if (!isLoggedIn && route.currentPage!.name != '/login') {
      return GetNavConfig.fromRoute('/login');
    }

    // If the user is logged in and tries to access the login page,
    // redirect them to the home page.
    if (isLoggedIn && route.currentPage!.name == '/login') {
      return GetNavConfig.fromRoute('/home');
    }

    // No redirection needed
    return super.redirectDelegate(route);
  }
}
