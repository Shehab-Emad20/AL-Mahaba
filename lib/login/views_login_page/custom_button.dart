import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widgets/custom_form.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textbutton;

  const CustomButton({
    super.key,
    required this.textbutton,
    Future<void> Function()? onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.8, // ضبط العرض بناءً على حجم الشاشة
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CustomForm()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFd0352c),
          padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02, // ارتفاع ديناميكي
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4, // إضافة بعض الظل لتوضيح شكل الزر
        ),
        child: Text(
          textbutton,
          style: TextStyle(
            color: kwhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: screenSize.width * 0.045, // حجم الخط استجابةً لحجم الشاشة
          ),
        ),
      ),
    );
  }
}
