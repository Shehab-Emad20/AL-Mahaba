import 'package:flutter/material.dart';

class NotesTextField extends StatelessWidget {
  const NotesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // ضبط العرض الثابت
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const TextField(
        maxLines: 3, // تقليل الأسطر لتصغير الارتفاع
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: 'ملاحظات',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 8, vertical: 8), // تعديل المسافات لتصغير الحجم
          border: InputBorder.none,
        ),
      ),
    );
  }
}
