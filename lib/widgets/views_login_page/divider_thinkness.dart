import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class DividerThinkness extends StatelessWidget {
  const DividerThinkness({
    super.key,
    required this.text,
  });
  final String text; // وسيط النص

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Divider(thickness: 1, color: kPrimaryColor), // خط أفقي
          ),
          const SizedBox(width: 8), // إضافة مسافة بين الخط والجملة
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(width: 6), // إضافة مسافة بين الجملة والخط
          const Expanded(
            child: Divider(thickness: 1, color: kPrimaryColor), // خط أفقي
          ),
        ],
      ),
    );
  }
}
