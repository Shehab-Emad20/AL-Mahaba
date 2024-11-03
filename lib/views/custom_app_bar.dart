import 'package:almahaba/views/custom_icon_mnue.dart';
import 'package:almahaba/views/custom_title_and_image.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomTitleAndImage(),
      actions: [
        CustomIconMnue(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
