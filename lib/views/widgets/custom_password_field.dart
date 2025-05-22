import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final VoidCallback onToggle;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.obscureText,
    required this.onToggle,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: onToggle,
          ),
        ),
      ),
    );
  }
}
