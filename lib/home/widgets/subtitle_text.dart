import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final double screenWidth;

  const SubtitleText({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final textFontSize = screenWidth > 600 
        ? screenWidth * 0.04  // Slightly smaller on tablets
        : screenWidth * 0.05; // Original size on phones

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.02,
        horizontal: screenWidth * 0.04,
      ),
      child: Text.rich(
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
        textAlign: TextAlign.center,
      ),
    );
  }
}
