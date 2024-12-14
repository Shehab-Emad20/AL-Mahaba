import 'package:almahaba/home/widgets/custom_icon_mnue.dart';
import 'package:flutter/material.dart';
import 'custom_title_and_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  // Define constant heights
  static const double _tabletHeight = 80.0;
  static const double _mobileHeight = 70.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = screenWidth > 600 ? _tabletHeight : _mobileHeight;

    return AppBar(
      // لون الخلفية للشريط
      title: const CustomTitleAndImage(),
      actions: const [CustomIconMenu()],
      toolbarHeight: appBarHeight,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_mobileHeight);
}
