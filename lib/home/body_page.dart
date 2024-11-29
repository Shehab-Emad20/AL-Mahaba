import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/home/custom_app_bar.dart';
import 'package:almahaba/home/drawer_widget.dart';
import 'package:almahaba/home/view_page.dart';
import 'package:flutter/material.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: CustomAppBar(),
      endDrawer: DrawerWidget(),
      body: ViewPage(),
    );
  }
}
