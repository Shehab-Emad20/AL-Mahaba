import 'package:flutter/material.dart';

class CustomDriverTextField extends StatelessWidget {
  final String hintText; // خاصية لتحديد النص التلميحي

  const CustomDriverTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
