import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final double screenWidth;

  const ResponsiveImage({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    // Adjust image height based on screen width
    final imageHeight = screenWidth > 600 
        ? screenWidth * 0.35  // Slightly smaller on tablets
        : screenWidth * 0.4;  // Original size on phones

    return Padding(
      padding: EdgeInsets.only(
        top: screenWidth * 0.08,
        bottom: screenWidth * 0.04,
      ),
      child: Image.asset(
        'assets/images/info.png',
        height: imageHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}
