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
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0), // إضافة بعض الهوامش
      child: Text(
        'المحبة للنقل البري والسياحي توفر لك خيارات مريحة وآمنة لرحلاتك، سواء بسيارة ملاكي، 7 راكب، أو باص. نضمن لك الأمان والراحة في كل رحلاتك. المحبة دائما معك.',
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.045, // حجم النص متجاوب
          fontWeight: FontWeight.normal, // الوزن العادي
        ),
        textAlign: TextAlign.center, // مركز النص
      ),
    );
  }
}
