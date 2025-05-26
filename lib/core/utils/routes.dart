import 'package:get/get.dart';
import 'package:pbrs_mart/views/auth/login.dart';
import 'package:pbrs_mart/views/auth/sign_up.dart';
import 'package:pbrs_mart/views/onboard/custom_bottom_bar.dart';
import 'package:pbrs_mart/views/onboard/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/Splash', page: () => SplashScreen()),
    GetPage(name: '/Login', page: () => LoginScreen()),
    GetPage(name: '/SignUp', page: () => SignUpScreen()),
    GetPage(name: '/BottomNav', page: () => CustomBottomNavBar()),
  ];

  static final String splash = '/Splash';
  static final String login = '/Login';
  static final String signUp = '/SignUp';
  static final String bottomNav = '/BottomNav';
}
