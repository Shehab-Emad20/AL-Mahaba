import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String textbutton;

  const CustomButton2({
    super.key,
    required this.textbutton,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.8, // ضبط العرض بناءً على حجم الشاشة
      child: ElevatedButton(
        onPressed: () {
          // أضف أي دالة أو إجراء هنا
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2196F3), // اللون الأزرق
          padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02, // ارتفاع ديناميكي
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4, // إضافة بعض الظل لتوضيح شكل الزر
        ),
        child: Center(
          // استخدام Center لتوسيع الزر بالكامل
          child: Text(
            textbutton,
            style: TextStyle(
              color: kwhiteColor,
              fontWeight: FontWeight.bold,
              fontSize:
                  screenSize.width * 0.045, // حجم الخط استجابةً لحجم الشاشة
            ),
          ),
        ),
      ),
    );
  }
}
