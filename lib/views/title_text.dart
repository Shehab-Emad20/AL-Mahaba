import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final double screenWidth;

  const TitleText({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final titleFontSize = screenWidth * 0.1;
    return Text(
      'المحبة ',
      style: TextStyle(
        color: Colors.red,
        fontSize: titleFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
