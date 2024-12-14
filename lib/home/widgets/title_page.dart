import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Calculate font size based on screen width with better scaling
    final fontSize = screenWidth > 600
        ? screenWidth * 0.035  // Slightly smaller on tablets
        : screenWidth * 0.04;  // Original size on phones

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.03,
      ),
      child: Text(
        'المحبة للنقل البري والسياحي توفر لك خيارات مريحة وآمنة لرحلاتك، سواء بسيارة ملاكي، 7 راكب، أو باص. نضمن لك الأمان والراحة في كل رحلاتك. المحبة دائما معك',
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          height: 1.5,  // Add line height for better readability
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
