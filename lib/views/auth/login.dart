import 'package:flutter/material.dart';
import 'package:pbrs_mart/l10n/generated/i10n/app_localizations.dart';
import 'package:pbrs_mart/views/auth/sign_up.dart';
import 'package:pbrs_mart/views/widgets/custom_bottom_bar.dart';
import 'package:pbrs_mart/views/widgets/custom_password_field.dart';
import 'package:pbrs_mart/views/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool agreeToTerms = false;
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

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
                key: _formKey,
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
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      hint: loc.mobileNumber,
                      label: loc.mobileNumber,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? loc.requiredField
                                  : null,
                    ),
                    const SizedBox(height: 20),
                    CustomPasswordField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      label: loc.password,
                      hint: loc.password,
                      onToggle:
                          () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),

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
                        onPressed: () {},
                        child: Text(
                          loc.forgotPassword,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: agreeToTerms,
                          onChanged:
                              (value) =>
                                  setState(() => agreeToTerms = value ?? false),
                        ),
                        Text(loc.terms),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Submit form
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CustomBottomNavBar(),
                              ),
                              (route) => false,
                            );
                          }
                        },
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
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignUpScreen(),
                                    ),
                                  ),
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
