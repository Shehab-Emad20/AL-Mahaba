import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // تأكد من استيراد ملف CustomAppBar

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), // استخدام CustomAppBar هنا
      body: Center(
        child: Text(
          'مرحبًا بك في تطبيق AL-MAHABA',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
