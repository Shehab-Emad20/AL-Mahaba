import 'package:almahaba/home/widgets/responsive_image.dart';
import 'package:almahaba/home/widgets/subtitle_text.dart';
import 'package:almahaba/home/widgets/title_page.dart';
import 'package:almahaba/home/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ResponsiveImage(screenWidth: screenWidth),
          const SizedBox(height: 20),
          TitleText(screenWidth: screenWidth),
          SubtitleText(screenWidth: screenWidth),
          const SizedBox(height: 20), // مسافة إضافية بين النصوص
          TitlePage(screenWidth: screenWidth), // إضافة الجزء الجديد
          const SizedBox(height: 20), // مسافة إضافية
          // const CustomButton(
          //   textbutton: 'اطلب الان رحلتك', onPressed: () {  },
        ],
      ),
    );
  }
}
