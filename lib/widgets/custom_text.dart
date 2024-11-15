import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'يتم أضافة 50 ج لكل ساعه أنتظار إضافيه أو تأخير',
      style: TextStyle(color: Colors.red),
    );
  }
}
