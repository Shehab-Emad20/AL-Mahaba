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
      "طلباتي",
      'طلبات'
    ];

    return Column(
      children: items.map((item) => _buildDrawerItem(context, item)).toList(),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // إضافة padding
      child: ListTile(
        title: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:
                MediaQuery.of(context).size.width * 0.037, // حجم النص متجاوب
          ),
        ),
        onTap: () => NavigationHandler.handleNavigation(context, item),
      ),
    );
  }
}
