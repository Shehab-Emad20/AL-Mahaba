import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText; // خاصية لتمرير النص المتغير

  const CustomTextField({
    super.key,
    required this.hintText, // التأكد من تمرير النص عند الإنشاء
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.8, // استخدام عرض ديناميكي
      height: screenSize.height * 0.06, // ارتفاع ديناميكي
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText, // استخدام النص المتغير هنا
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
