import 'package:flutter/material.dart';

class CustomIconMenu extends StatelessWidget {
  const CustomIconMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(
          Icons.menu,
          color: Colors.red,
        ),
      ),
      onPressed: () {
        Scaffold.of(context).openEndDrawer(); // فتح القائمة الجانبية من اليمين
      },
    );
  }
}
