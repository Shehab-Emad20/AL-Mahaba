import 'package:flutter/material.dart';

class CustomTextFeildEmailForForgot extends StatelessWidget {
  const CustomTextFeildEmailForForgot({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: "بريدك الإلكتروني",
        prefixIcon: const Icon(Icons.email,
            color: Colors.red), // إضافة أيقونة البريد الإلكتروني
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // تحديد الزوايا
          borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5), // تحديد لون الحدود وحجمها عند عدم التركيز
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // تحديد الزوايا
        ),
      ),
    );
  }
}