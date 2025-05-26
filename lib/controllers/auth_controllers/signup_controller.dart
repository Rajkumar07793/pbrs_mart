import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/models/user_model.dart';
import 'package:pbrs_mart/network/api_service.dart';

class SignUpController extends GetxController {
  final ApiService apiService = ApiService();

  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  // TextEditingControllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUpUser({
    required String name,
    required String mobile,
    required String password,
  }) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final user = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      mobile: mobileController.text.trim(),
      password: passwordController.text.trim(),
    );

    final response = await apiService.signUp(user);
    isLoading.value = false;

    if (response != null && response.statusCode == 200) {
      Get.snackbar("Success", "User signed up successfully");
    } else {
      Get.snackbar("Error", "Signup failed");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
