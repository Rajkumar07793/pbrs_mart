import 'package:flutter/material.dart';
import 'package:pbrs_mart/l10n/generated/i10n/app_localizations.dart';
import 'package:pbrs_mart/views/widgets/custom_password_field.dart';
import 'package:pbrs_mart/views/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF1FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Form(
            key: _formKey,
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
                  controller: _nameController,
                  hint: loc.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: loc.email,
                  controller: _emailController,
                  hint: 'test@example.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    if (!RegExp(
                      r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$',
                    ).hasMatch(value)) {
                      return loc.invalidEmail;
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: loc.mobileNumber,
                  controller: _mobileController,
                  hint: '9876543210',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                ),

                CustomPasswordField(
                  label: loc.password,
                  hint: loc.password,
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                  onToggle: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
                CustomPasswordField(
                  label: loc.confirmPassword,
                  hint: loc.confirmPassword,
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  onToggle: () {
                    setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    );
                  },
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return loc.passwordMismatch;
                    }
                    if (value == null || value.isEmpty) {
                      return loc.requiredField;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A4FA3),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Submit form
                      }
                    },
                    child: Text(
                      loc.signUp,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
