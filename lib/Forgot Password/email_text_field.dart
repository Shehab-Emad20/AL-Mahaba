import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final String hintText; // النص التلميحي الثابت هنا

  const EmailTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery للحصول على حجم الشاشة
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.01, // 1% من عرض الشاشة لتقليل المسافة
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText, // استخدام النص الثابت هنا
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: kwhiteColor,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
