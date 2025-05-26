import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/controllers/auth_controllers/login_controller.dart';
import 'package:pbrs_mart/core/utils/routes.dart';
import 'package:pbrs_mart/l10n/generated/i10n/app_localizations.dart';
import 'package:pbrs_mart/views/widgets/custom_elevated_button.dart';
import 'package:pbrs_mart/views/widgets/custom_password_field.dart';
import 'package:pbrs_mart/views/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFFCF4FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_prbs_3.png', height: 100),
                    const SizedBox(height: 20),
                    Text(
                      loc.appName,
                      style: const TextStyle(
                        fontFamily: 'Cursive',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      loc.welcomeBack,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      loc.signInToContinue,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: controller.mobileController,
                      keyboardType: TextInputType.phone,
                      hint: loc.mobileNumber,
                      label: loc.mobileNumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return loc.requiredField;
                        }
                        if (value.length < 6) return loc.mobileNumber;
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomPasswordField(
                      controller: controller.passwordController,
                      label: loc.password,
                      hint: loc.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return loc.requiredField;
                        }
                        if (value.length < 6) return loc.passwordLength;
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          final mobile = controller.mobileController.text;

                          if (mobile.isEmpty || mobile.length < 10) {
                            Get.snackbar(
                              "Error",
                              "Enter a valid mobile number",
                            );
                            return;
                          }

                          controller.mobileController.text = mobile;

                          // Send OTP first
                          final response = await controller.apiService
                              .sendResetPasswordOtp(mobile: mobile);

                          if (response != null && response.statusCode == 200) {
                            Get.snackbar(
                              "Success",
                              "OTP sent to your mobile",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.teal,
                              colorText: Colors.white,
                              icon: const Icon(
                                Icons.check_circle_outline,
                                color: Colors.white,
                              ),
                            );
                            // Show popup after OTP is sent
                            showForgetPopUp(context, LoginController());
                          } else {
                            Get.snackbar(
                              "Error",
                              "Failed to send OTP",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              icon: const Icon(
                                Icons.error_outline,
                                color: Colors.white,
                              ),
                            );
                          }
                        },

                        child: Text(
                          loc.forgotPassword,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.agreeToTerms.value,
                            onChanged: controller.toggleAgreeToTerms,
                          ),
                        ),
                        Flexible(child: Text(loc.terms)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              controller.isLoading.value
                                  ? null
                                  : controller.submitLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6A4FA3),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child:
                              controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : Text(
                                    loc.signIn,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(text: loc.noAccount),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.signUp),
                              child: Text(
                                ' ${loc.signUpHere}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showForgetPopUp(BuildContext ctx, LoginController controller) {
  showDialog(
    context: ctx,
    builder:
        (ctx) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Change Password',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Cursive',
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: CustomElevatedButton(
                height: 50,
                width: double.infinity,
                onPressed: () {
                  controller.submitResetPassword();
                },
                title: 'Submit',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Haven't received OTP ?",
                  style: TextStyle(fontSize: 14),
                ),
                InkWell(
                  onTap: () async {
                    final mobile = controller.mobileController.text;

                    if (mobile.isEmpty || mobile.length < 10) {
                      print(mobile);
                      Get.snackbar(
                        "Error",
                        "Enter a valid mobile number",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.teal,
                        colorText: Colors.white,
                        borderRadius: 12,
                        margin: EdgeInsets.all(16),
                        icon: Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                        duration: Duration(seconds: 3),
                        animationDuration: Duration(milliseconds: 300),
                        forwardAnimationCurve: Curves.easeOutBack,
                      );
                      return;
                    }
                    // Send OTP first
                    final response = await controller.apiService
                        .sendResetPasswordOtp(mobile: mobile);
                    if (response != null && response.statusCode == 200) {
                      Get.snackbar(
                        "Success",
                        "Resend OTP to your mobile",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.teal,
                        colorText: Colors.white,
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      Get.snackbar(
                        "Error",
                        "Failed to send OTP",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        icon: const Icon(
                          Icons.error_outline,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Resend",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
          scrollable: true,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              CustomTextField(
                controller: controller.otpController,
                hint: 'Enter 6 Digit OTP',
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                controller: controller.newPwdController,
                hint: 'Enter Password',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: controller.confirmController,
                hint: 'Confirm Password',
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
  );
}
