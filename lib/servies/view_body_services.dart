import 'package:almahaba/servies/custom_image.dart';
import 'package:almahaba/servies/custom_text_srvices.dart';
import 'package:flutter/material.dart';

class ViewBodyServices extends StatelessWidget {
  const ViewBodyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // النص في الأسفل
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextServices(), // النص أولاً
          ],
        ),
        // الصورة في الأعلى مع إزاحة لأسفل
        Positioned(
          top: 50, // إزاحة الصورة لأسفل بمقدار 50
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.topCenter, // محاذاة الصورة في أعلى الشاشة
            child: CustomImage(), // الصورة
          ),
        ),
      ],
    );
  }
}
