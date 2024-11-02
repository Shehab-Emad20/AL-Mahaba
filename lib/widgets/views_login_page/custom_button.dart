import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.textbutton,
  });
  final String textbutton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // إضافة وظيفة تسجيل الدخول أو أي إجراء آخر هنا
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFd0352c),
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        textbutton,
        style: const TextStyle(
            fontSize: 20, color: kwhiteColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
