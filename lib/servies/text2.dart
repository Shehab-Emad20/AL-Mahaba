import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class Text2 extends StatelessWidget {
  const Text2({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'شركة المحبة للنقل تقدم مجموعة متنوعة من خيارات',
          style: TextStyle(
            fontSize: fontSize,
            color: kPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'المركبات لتلبية احتياجات النقل المختلفة للعملاء',
          style: TextStyle(
            fontSize: fontSize,
            color: kPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
