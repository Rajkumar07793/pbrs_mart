import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/controllers/auth_controllers/signup_controller.dart';
import 'package:pbrs_mart/core/utils/routes.dart';
import 'package:pbrs_mart/l10n/generated/i10n/app_localizations.dart';
import 'package:pbrs_mart/views/widgets/custom_password_field.dart';
import 'package:pbrs_mart/views/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF1FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/images/ic_prbs_3.png', height: 80),
                const SizedBox(height: 12),
                Text(
                  loc.appName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cursive',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  loc.welcomeBack,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  loc.signUpToContinue,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  label: loc.name,
                  controller: controller.nameController,
                  hint: loc.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                CustomTextField(
                  label: loc.email,
                  controller: controller.emailController,
                  hint: 'test@example.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                CustomTextField(
                  label: loc.mobileNumber,
                  controller: controller.mobileController,
                  hint: '9876543210',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                CustomPasswordField(
                  label: loc.password,
                  hint: loc.password,
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                CustomPasswordField(
                  label: loc.confirmPassword,
                  hint: loc.confirmPassword,
                  controller: controller.confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    if (value != controller.passwordController.text) {
                      return loc.passwordMismatch;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                Obx(() {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6A4FA3),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed:
                          controller.isLoading.value
                              ? null
                              : () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.signUpUser(
                                    name: controller.nameController.text,
                                    mobile: controller.mobileController.text,
                                    password:
                                        controller.passwordController.text,
                                  );
                                }
                              },
                      child:
                          controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : Text(
                                loc.signUp,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(text: loc.haveAnAccount),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.login),
                          child: Text(
                            ' ${loc.signInHere}',
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
    );
  }
}
