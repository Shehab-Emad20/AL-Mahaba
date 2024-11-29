import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'المحبة للنقل البري والسياحي توفر لك خيارات مريحة وآمنة لرحلاتك، سواء بسيارة ملاكي، 7 راكب، أو باص. نضمن لك الأمان والراحة في كل رحلاتك. المحبة دائما معك',
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth > 600
              ? screenWidth * 0.045
              : screenWidth * 0.04, // زيادة الحجم على الشاشات الكبيرة
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
