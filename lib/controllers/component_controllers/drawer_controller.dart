// lib/controllers/component_controllers/drawer_controller.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pbrs_mart/core/utils/routes.dart';

class DrawerControllerGetx extends GetxController {
  final userName =
      'Prashant Patel'.obs; // Optionally fetched from storage later

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Get.offAllNamed(AppRoutes.login);
  }
}
