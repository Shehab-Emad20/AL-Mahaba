import 'package:flutter/material.dart';

class CustomTitleAndImage extends StatelessWidget {
  const CustomTitleAndImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              right: 8.0), // تقليل المسافة بين الشعار والعنوان
          child: Image.asset(
            'assets/images/logo.png', // تأكد من المسار الصحيح للصورة
            height: 40, // ضبط ارتفاع الشعار
          ),
        ),
        Text(
          'AL-MAHABA',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
