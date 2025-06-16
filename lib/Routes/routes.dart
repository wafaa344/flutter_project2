import 'package:get/get.dart';
import 'package:project2/homepage/home_page_binding.dart';
import '../bottom_nav/bottom_nav.dart';
import '../company_details/company_details_view.dart';
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
  static const String main = '/';
  static const String home = '/home';
  static const String company_details = "/company_details";

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

    GetPage(name: main, page: () => const BottomNav()),
    GetPage(name: home, page: () => const HomePage(),binding: CompanyBindings()),
    GetPage(name: company_details, page: () => const CompanyDetails()),
  ];
}
