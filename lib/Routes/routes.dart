import 'package:get/get.dart';
import '../homepage/home_page_screen.dart';
import '../login/login_binding.dart';
import '../login/loginscreen.dart';
import '../logout/logout_binding.dart';
import '../signup/signup_binding.dart';
import '../signup/signup_screen.dart';
import '../splash/splash_binding.dart';
import '../splash/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const signup = '/signup';
  static const homepage = '/homepage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: signup,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: homepage,
      page: () => const HomePageScreen(),
      binding: LogoutBinding(),
    ),
  ];
}
