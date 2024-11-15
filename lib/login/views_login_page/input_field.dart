import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const InputField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01), // تباعد عمودي
      child: TextField(
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: screenSize.width * 0.045), // حجم خط ديناميكي
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: screenSize.width * 0.045,
            color: kPrimaryColor.withOpacity(0.8), // ضبط الشفافية
          ),
          prefixIcon: Icon(icon, color: kPrimaryColor),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15), // زيادة padding
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // جعل الحدود أكثر سلاسة
            borderSide: const BorderSide(
                color: kPrimaryColor, width: 1.5), // عرض الحدود
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // جعل الحدود أكثر سلاسة عند التركيز
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
