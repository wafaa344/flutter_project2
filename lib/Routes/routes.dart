import 'package:get/get.dart';
import 'package:project2/homepage/home_page_binding.dart';
import 'package:project2/search/search_binding.dart';
import 'package:project2/survey/survey_page.dart';
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
import '../survey/cost/cost_binding.dart';
import '../survey/cost/cost_dialog.dart';
import '../survey/survey_binding.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const signup = '/signup';
  static const String main = '/';
  static const String home = '/home';
  static const String company_details = "/company_details";
  static const String survey = '/survey';
  static const String cost = '/cost';

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
      name: home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        SearchBindings().dependencies();
        LogoutBinding().dependencies();
      }),
    ),
    GetPage(
      name: survey,
      page: () => SurveyPage(),
      binding: SurveyBinding(),
    ),
    GetPage(
      name: cost,
      page: () => CostDialog(),
      binding: CostBinding(),
    ),



    GetPage(name: main, page: () => const BottomNav()),


  ];
}
