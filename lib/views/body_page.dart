import 'package:almahaba/views/cc.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // تأكد من استيراد ملف CustomAppBar

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      endDrawer: DrawerWidget(), // استخدام الـ Drawer Widget
    );
  }
}