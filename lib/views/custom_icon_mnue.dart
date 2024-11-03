import 'package:flutter/material.dart';

class CustomIconMenu extends StatelessWidget {
  const CustomIconMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(
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
