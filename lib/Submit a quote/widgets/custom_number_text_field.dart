import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumberTextField extends StatelessWidget {
  final String hintText; // خاصية لتحديد النص التلميحي

  const CustomNumberTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.number, // لعرض لوحة المفاتيح الرقمية فقط
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // يسمح بإدخال الأرقام فقط
        ],
        textAlign: TextAlign.right, // لضبط محاذاة النص لليمين
        textDirection: TextDirection.rtl, // لتحديد اتجاه النص من اليمين لليسار
        decoration: InputDecoration(
          hintText: hintText, // استخدام الخاصية لتحديد النص التلميحي
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        ),
      ),
    );
  }
}
