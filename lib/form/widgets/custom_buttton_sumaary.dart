import 'package:flutter/material.dart';

class CustomButttonSumaary extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButttonSumaary({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    final containerWidth = isDesktop ? 600.0 : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);
    final buttonHeight = isDesktop ? 60.0 : (isTablet ? 50.0 : 45.0);
    final fontSize = isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0);

    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
      child: Container(
        width: containerWidth,
        height: buttonHeight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
