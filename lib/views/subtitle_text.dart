import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final double screenWidth;

  const SubtitleText({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final textFontSize = screenWidth * 0.05;
    return Text.rich(
      TextSpan(
        text: 'معاك في ',
        style: TextStyle(
          color: Colors.black,
          fontSize: textFontSize,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: 'كله ',
            style: TextStyle(
              color: Colors.red,
              fontSize: textFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'رحلاتك',
            style: TextStyle(
              color: Colors.black,
              fontSize: textFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
