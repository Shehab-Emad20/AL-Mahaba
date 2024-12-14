import 'package:flutter/material.dart';
import 'package:almahaba/utils/constants.dart'; // تأكد من أن لديك الثوابت المناسبة في هذا الملف

class CustomTextFieldSingUp extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final IconData icon;
  final String hint;
  final text;
  final double? fontSize;

  const CustomTextFieldSingUp({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.icon,
    this.hint = '',
    this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = text;
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: fontSize),
        prefixIcon: Icon(icon, color: Colors.red),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    );
  }
}
