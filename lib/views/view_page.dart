import 'package:almahaba/login/views_login_page/custom_button.dart';
import 'package:almahaba/views/responsive_image.dart';
import 'package:almahaba/views/title_page.dart';
import 'package:flutter/material.dart';
import 'title_text.dart';
import 'subtitle_text.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
          const CustomButton(
            textbutton: 'اطلب الان رحلتك',
          )
        ],
      ),
    );
  }
}
