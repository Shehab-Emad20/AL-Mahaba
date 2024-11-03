import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/views/drawer_widget.dart';
import 'package:almahaba/views/view_page.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart'; // تأكد من استيراد ملف CustomAppBar

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: CustomAppBar(),
      endDrawer: DrawerWidget(), // استخدام الـ Drawer Widget

      body: ViewPage(),
    );
  }
}
