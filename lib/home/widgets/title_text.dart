import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final double screenWidth;

  const TitleText({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    // More refined font size calculation based on screen width
    final titleFontSize = screenWidth > 600 
        ? screenWidth * 0.08  // Slightly smaller on tablets
        : screenWidth * 0.1;  // Original size on phones

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.02,
        horizontal: screenWidth * 0.04,
      ),
      child: Text(
        'المحبة ',
        style: TextStyle(
          color: Colors.red,
          fontSize: titleFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
