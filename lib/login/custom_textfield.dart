import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldlogin extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final IconData icon;
  final String hint;
  final String text;

  const CustomTextFieldlogin({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.icon,
    this.label = '',
    this.hint = '', // Optional hint text
    this.text = '', // Optional hint text
  });

  @override
  Widget build(BuildContext context) {
    controller.text = text;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        ),
      ),
    );
  }
}
