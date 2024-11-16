import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text; // متغير النص الذي سيتم تحديده

  const SubmitButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // تحديد حجم النص بناءً على عرض الشاشة
    double fontSize;
    if (screenSize.width <= 375) {
      fontSize = 14; // الأجهزة الصغيرة مثل iPhone SE
    } else if (screenSize.width <= 520) {
      fontSize = 22; // الأجهزة المتوسطة مثل iPhone 12 Pro Max
    } else if (screenSize.width <= 768) {
      fontSize = 22; // الأجهزة اللوحية الصغيرة مثل iPad
    } else {
      fontSize = 20; // الأجهزة الكبيرة مثل iPad Pro
    }

    return SizedBox(
      width: screenSize.width * 0.9, // نفس عرض input text
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(
              vertical:
                  screenSize.height * 0.02), // يجعل الحواف مريحة حسب حجم الشاشة
        ),
        child: Text(
          text, // النص المتغير هنا
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize, // تغيير حجم الخط حسب الجهاز
          ),
        ),
      ),
    );
  }
}
