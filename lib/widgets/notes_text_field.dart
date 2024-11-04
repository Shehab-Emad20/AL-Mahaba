import 'package:flutter/material.dart';

class NotesTextField extends StatelessWidget {
  const NotesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // ضبط العرض حسب الحاجة
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const TextField(
        maxLines: 4, // السماح بإدخال نص متعدد الأسطر
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: 'ملاحظات',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
