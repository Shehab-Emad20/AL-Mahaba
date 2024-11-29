import 'package:almahaba/services/text1.dart';
import 'package:almahaba/services/text2.dart';
import 'package:flutter/material.dart';

class CustomTextServices extends StatelessWidget {
  const CustomTextServices({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على حجم الشاشة
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // تخصيص النص بناءً على حجم الشاشة
    double fontSize;
    double paddingTop;

    if (screenWidth <= 375) {
      // أحجام شاشات صغيرة مثل iPhone SE و Galaxy S20
      fontSize = 14;
      paddingTop = 50;
    } else if (screenWidth <= 520) {
      // أحجام شاشات متوسطة مثل iPhone 12 Pro Max و iPad
      fontSize = 18;
      paddingTop = 60;
    } else {
      // أحجام شاشات كبيرة مثل iPad Pro و أجهزة أخرى
      fontSize = 30;
      paddingTop = 80;
    }

    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Column(
        children: [
          Text1(fontSize: fontSize), // استدعاء النص الأول
          const SizedBox(height: 15), // إضافة مسافة بين النصين
          Text2(fontSize: fontSize), // استدعاء النص الثاني
        ],
      ),
    );
  }
}
