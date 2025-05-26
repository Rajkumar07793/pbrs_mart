import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/controllers/textfield_controllers/pwd_controller.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  // Accept a PasswordFieldController, or create one if not provided
  final PasswordFieldController passwordController;

  CustomPasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
    PasswordFieldController? passwordController,
  }) : passwordController =
           passwordController ?? Get.put(PasswordFieldController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller,
        obscureText: passwordController.obscureText.value,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: IconButton(
            icon: Icon(
              passwordController.obscureText.value
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: passwordController.toggleObscure,
          ),
        ),
      ),
    );
  }
}
