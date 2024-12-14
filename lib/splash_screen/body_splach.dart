import 'package:flutter/material.dart';

class BodySplach extends StatelessWidget {
  const BodySplach({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width to make responsive sizes
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: screenWidth * 0.12, // Responsive image size
        ),
        SizedBox(width: screenWidth * 0.02), // Responsive spacing
        Text(
          'AL-MAHABA',
          style: TextStyle(
            fontSize: screenWidth * 0.08, // Responsive text size
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
