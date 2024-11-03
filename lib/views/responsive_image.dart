import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  final double screenWidth;

  const ResponsiveImage({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final imageHeight = screenWidth * 0.4;
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Image.asset(
        'assets/images/info.png',
        height: imageHeight,
      ),
    );
  }
}
