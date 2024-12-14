import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldConffimPassword extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hint;
  final double? fontSize;

  const CustomTextFieldConffimPassword({
    super.key,
    required this.controller,
    required this.obscureText,
    this.hint = '', // Optional hint text
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TextField(
          controller: controller,
          obscureText: obscureText,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: fontSize),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: fontSize),
            prefixIcon: const Icon(Icons.lock, color: Colors.red),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.05,
              vertical: constraints.maxHeight * 0.02,
            ),
          ),
        );
      },
    );
  }
}
