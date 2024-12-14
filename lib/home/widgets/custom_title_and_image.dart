import 'package:flutter/material.dart';

class CustomTitleAndImage extends StatelessWidget {
  const CustomTitleAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth > 600 ? 50.0 : 40.0;
    final fontSize = screenWidth > 600 ? 24.0 : 20.0;
    final padding = screenWidth > 600 ? 12.0 : 8.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align to the left
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(right: padding),
          child: Image.asset(
            'assets/images/logo.png',
            height: imageSize,
          ),
        ),
        Text(
          'AL-MAHABA',
          style: TextStyle(
            color: Colors.red,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
