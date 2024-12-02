import 'package:almahaba/home/widgets/drawerheader_widget%20.dart';
import 'package:flutter/material.dart';
import 'drawer_item_list.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeaderWidget(), // استدعاء العنصر الخاص بالرأس
          DrawerItemList(), // استدعاء قائمة العناصر
        ],
      ),
    );
  }
}
