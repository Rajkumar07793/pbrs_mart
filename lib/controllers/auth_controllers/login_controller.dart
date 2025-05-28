import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/core/utils/routes.dart';
import 'package:pbrs_mart/network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final ApiService apiService = ApiService();

  var isLoading = false.obs;
  var agreeToTerms = false.obs;

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final newPwdController = TextEditingController();
  final otpController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void onClose() {
    passwordController.dispose();
    otpController.dispose();
    confirmController.dispose();
    newPwdController.dispose();
    super.onClose();
  }

  void toggleAgreeToTerms(bool? value) {
    agreeToTerms.value = value ?? false;
  }

  bool validate() {
    if (!agreeToTerms.value) {
      Get.snackbar('Error', 'You must agree to the terms');
      return false;
    }
    return formKey.currentState?.validate() ?? false;
  }

  void submitLogin() async {
    if (!validate()) return;

    isLoading.value = true;
    final response = await apiService.loginUser(
      mobile: mobileController.text.trim(),
      password: passwordController.text.trim(),
    );
    isLoading.value = false;

    if (response != null && response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      Get.snackbar(
        'Success',
        'Login successful',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(16),
        icon: const Icon(Icons.check_circle_outline, color: Colors.white),
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 300),
        forwardAnimationCurve: Curves.easeOutBack,
      );

      // ✅ Navigate to home
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      Get.snackbar(
        'Login Failed',
        'Invalid mobile or password',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(16),
        icon: const Icon(Icons.check_circle_outline, color: Colors.white),
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 300),
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  void requestResetPasswordOtp() async {
    final mobile = mobileController.text;
    if (mobile.isEmpty || mobile.length < 10) {
      Get.snackbar("Error", "Enter a valid mobile number");
      return;
    }

    isLoading.value = true;
    final response = await apiService.sendResetPasswordOtp(mobile: mobile);
    isLoading.value = false;

    if (response != null && response.statusCode == 200) {
      Get.snackbar(
        "Success",
        "OTP sent to your mobile",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        borderRadius: 12,
        margin: EdgeInsets.all(16),
        icon: Icon(Icons.check_circle_outline, color: Colors.white),
      );
    } else {
      Get.snackbar(
        "Error",
        "Failed to send OTP",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.teal,
        colorText: Colors.white,
      );
    }
  }

  void submitResetPassword() async {
    final mobile = mobileController.text;
    final otp = otpController.text;
    final password = newPwdController.text;
    final confirm = confirmController.text;

    if (password != confirm) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    final response = await apiService.resetPassword(
      mobile: mobile,
      password: password,
      confirmPassword: confirm,
      otp: otp,
    );

    if (response != null && response.statusCode == 200) {
      Get.back();
      Get.snackbar('Success', 'Password has been reset');
    } else {
      print(mobile);
      Get.snackbar('Error', 'Failed to reset password');
    }
  }
}
