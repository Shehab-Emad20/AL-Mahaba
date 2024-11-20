import 'package:flutter/material.dart';
import 'package:almahaba/utils/constants.dart'; // تأكد من أن لديك الثوابت المناسبة في هذا الملف

class CustomTextFieldSingUp extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final IconData icon;
  final String hint;

  const CustomTextFieldSingUp({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.icon,
    this.hint = '', // نص تلميح اختياري
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.right, // محاذاة النص إلى اليمين
      decoration: InputDecoration(
        hintText: hint, // نص التلميح
        prefixIcon: Icon(icon, color: Colors.red), // الأيقونة في البداية
        filled: true, // ملء خلفية الحقل
        fillColor: Colors.white, // تغيير لون خلفية الحقل إلى الأبيض
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
