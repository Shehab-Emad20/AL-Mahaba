import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldConffimPassword extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hint;

  const CustomTextFieldConffimPassword({
    super.key,
    required this.controller,
    required this.obscureText,
    this.hint = '', // Optional hint text
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
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
