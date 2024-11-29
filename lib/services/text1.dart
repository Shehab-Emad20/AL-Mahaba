import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  const Text1({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'خدمات النقل المقدمة من شركة المحبة ',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
