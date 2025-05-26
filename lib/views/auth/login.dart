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
                        if (value.length < 6) return loc.passwordLength;
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
                        onPressed: () {
                          showForgetPopUp(
                            context,
                            controller.otpController,
                            controller.forgetPwdController,
                            controller.confirmController,
                          );
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
                            onChanged:
                                (val) =>
                                    controller.agreeToTerms.value =
                                        val ?? false,
                          ),
                        ),
                        Flexible(child: Text(loc.terms)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.submitLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A4FA3),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          loc.signIn,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
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

void showForgetPopUp(
  BuildContext ctx,
  TextEditingController otpcontroller,
  TextEditingController pwdcontroller,
  TextEditingController confirmcontroller,
) {
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
                  Navigator.pop(ctx);
                  // Add controller logic here
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
                  onTap: () {
                    // Trigger resend logic
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
            children: [
              CustomTextField(
                controller: otpcontroller,
                hint: 'Enter 6 Digit OTP',
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                controller: pwdcontroller,
                hint: 'Enter Password',
                keyboardType: TextInputType.text,
              ),
              CustomTextField(
                controller: confirmcontroller,
                hint: 'Confirm Password',
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
  );
}
