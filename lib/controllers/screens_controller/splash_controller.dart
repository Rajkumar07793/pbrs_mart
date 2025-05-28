import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pbrs_mart/core/utils/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 3)); // optional splash delay

    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
