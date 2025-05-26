import 'package:get/get.dart';
import 'package:pbrs_mart/core/utils/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
