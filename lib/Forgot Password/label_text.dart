import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;

  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    // تحديد حجم النص بناءً على عرض الشاشة
    double fontSize;

    if (screenWidth <= 375) {
      // الأجهزة الصغيرة مثل iPhone SE
      fontSize = 20;
    } else if (screenWidth <= 520) {
      // الأجهزة المتوسطة مثل iPhone 12 Pro Max
      fontSize = 22;
    } else if (screenWidth <= 768) {
      // الأجهزة اللوحية الصغيرة مثل iPad
      fontSize = 24;
    } else {
      // الأجهزة الكبيرة مثل iPad Pro
      fontSize = 26;
    }

    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize, // تحديد حجم النص بناءً على العرض
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
