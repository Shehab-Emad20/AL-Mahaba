import 'package:flutter/material.dart';

class BodySplach extends StatelessWidget {
  const BodySplach({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 50, // تحديد حجم الصورة
        ),
        const SizedBox(width: 10), // مسافة بين النص والصورة
        const Text(
          'AL-MAHABA',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ],
    );
  }
}
