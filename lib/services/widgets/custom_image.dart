import 'package:flutter/material.dart';
import 'package:almahaba/utils/app_images.dart'; // تأكد من استيراد المسار الصحيح

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على عرض الشاشة
    double screenWidth = MediaQuery.of(context).size.width;

    // تحديد حجم الصورة بناءً على عرض الشاشة
    double imageSize;

    if (screenWidth <= 375) {
      // الهواتف الصغيرة مثل iPhone SE
      imageSize = 325; // تحديد حجم مناسب
    } else if (screenWidth <= 520) {
      // الهواتف المتوسطة مثل iPhone 12 Pro Max
      imageSize = 450;
    } else if (screenWidth <= 768) {
      // الأجهزة اللوحية الصغيرة مثل iPad
      imageSize = 550;
    } else {
      // الشاشات الكبيرة مثل iPad Pro
      imageSize = 750;
    }

    return Image.asset(
      Assets.imagesmahaba, // استخدام المسار من class Assets
      width: imageSize, // تعيين عرض الصورة بناءً على حجم الشاشة
      height: imageSize, // تعيين ارتفاع الصورة بناءً على حجم الشاشة
    );
  }
}
