import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/core/utils/routes.dart';
import 'package:pbrs_mart/models/user_model.dart';
import 'package:pbrs_mart/network/api_service.dart';
import 'package:pbrs_mart/views/widgets/custom_elevated_button.dart';
import 'package:pbrs_mart/views/widgets/custom_textfield.dart';

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
  final otpController = TextEditingController(); // for OTP input

  void signUpUser({
    required String name,
    required String mobile,
    required String password,
  }) async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text,
      password: passwordController.text,
    );

    final response = await apiService.signUp(user);
    isLoading.value = false;

    if (response != null && response.statusCode == 200) {
      // Show OTP dialog
      showOtpDialog(Get.context!);
    } else if (response?.statusCode == 400) {
      Get.snackbar(
        "Error",
        "The mobile has already been taken",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        borderRadius: 12,
        margin: EdgeInsets.all(16),
        icon: Icon(Icons.error_outline, color: Colors.white),
      );
    } else {
      Get.snackbar(
        "Error",
        "Signup failed",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        borderRadius: 12,
        margin: EdgeInsets.all(16),
        icon: Icon(Icons.error_outline, color: Colors.white),
      );
    }
  }

  void showOtpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              children: const [
                Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cursive',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Enter OTP sent to your mobile number.',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  hint: 'Enter 6 Digit OTP',
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  width: double.infinity,
                  onPressed: () async {
                    final response = await apiService.verifyOtp(
                      mobile: mobileController.text,
                      otp: otpController.text,
                    );

                    if (response != null && response.statusCode == 200) {
                      Get.back(); // close dialog
                      Get.snackbar(
                        "Verified",
                        "OTP Verified Successfully",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.teal,
                        colorText: Colors.white,
                        borderRadius: 12,
                        margin: EdgeInsets.all(16),
                        icon: Icon(Icons.done, color: Colors.white),
                      );
                      Get.offNamed(AppRoutes.login);
                    } else {
                      Get.snackbar(
                        "Failed",
                        "OTP Verification Failed",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.teal,
                        colorText: Colors.white,
                        borderRadius: 12,
                        margin: EdgeInsets.all(16),
                        icon: Icon(Icons.error_outline, color: Colors.white),
                      );
                    }
                  },
                  title: 'Submit',
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Didn't receive OTP?"),
                  TextButton(
                    onPressed: () async {
                      // You can call your resend OTP logic here
                      final response = await apiService.resendOtp(
                        mobile: mobileController.text,
                      );

                      if (response != null && response.statusCode == 200) {
                        Get.snackbar(
                          "OTP Sent",
                          "OTP resent successfully to your mobile number.",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.teal,
                          colorText: Colors.white,
                          borderRadius: 12,
                          margin: EdgeInsets.all(16),
                          icon: Icon(Icons.done, color: Colors.white),
                        );
                      } else {
                        Get.snackbar(
                          "Failed",
                          "Could not resend OTP. Please try again.",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.teal,
                          colorText: Colors.white,
                          borderRadius: 12,
                          margin: EdgeInsets.all(16),
                          icon: Icon(Icons.error_outline, color: Colors.white),
                        );
                      }
                    },
                    child: const Text('Resend'),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
