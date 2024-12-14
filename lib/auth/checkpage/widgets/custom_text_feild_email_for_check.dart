import 'package:flutter/material.dart';

class CustomTextFeildEmailForCheck extends StatelessWidget {
  const CustomTextFeildEmailForCheck({
    super.key,
    required this.emailController,
    this.fontSize,
  });

  final TextEditingController emailController;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return TextField(
          controller: emailController,
          style: TextStyle(fontSize: fontSize),
          decoration: InputDecoration(
            hintText: "إدخل الرمز",
            hintStyle: TextStyle(fontSize: fontSize),
            prefixIcon: const Icon(Icons.verified_user, color: Colors.red),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
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
