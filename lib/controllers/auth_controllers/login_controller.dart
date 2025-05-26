import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var agreeToTerms = false.obs;

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPwdController = TextEditingController();
  final otpController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
    forgetPwdController.dispose();
    otpController.dispose();
    confirmController.dispose();
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

  void submitLogin() {
    if (validate()) {
      // Implement your login logic here
      // For example navigate to home or bottom nav bar
      Get.offAllNamed('/bottom_nav'); // or your route
    }
  }
}
