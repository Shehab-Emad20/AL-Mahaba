import 'package:almahaba/utils/navigation_handler.dart';
import 'package:flutter/material.dart';

class DrawerItemList extends StatelessWidget {
  const DrawerItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'تسجيل الدخول',
      'إنشاء حساب',
      'الرئيسية',
      'خدماتنا',
      'طلبات'
    ];

    return Column(
      children: items.map((item) => _buildDrawerItem(context, item)).toList(),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String item) {
    return ListTile(
      title: Text(item),
      onTap: () => NavigationHandler.handleNavigation(context, item),
    );
  }
}
