import 'package:almahaba/home/custom_icon_mnue.dart';
import 'package:flutter/material.dart';
import 'custom_title_and_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // لون الخلفية للشريط
      title: const CustomTitleAndImage(),
      actions: const [CustomIconMenu()],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(70); // تغيير ارتفاع الشريط إذا لزم الأمر
}
