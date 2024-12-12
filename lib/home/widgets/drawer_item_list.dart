import 'package:almahaba/utils/cashe_helper.dart';
import 'package:almahaba/utils/navigation_handler.dart';
import 'package:flutter/material.dart';

class DrawerItemList extends StatefulWidget {
  const DrawerItemList({super.key});

  @override
  State<DrawerItemList> createState() => _DrawerItemListState();
}

class _DrawerItemListState extends State<DrawerItemList> {
  String? token;
  @override
  void initState() {
    super.initState();

    token = CacheHelper.getString('token');

    if (token == null) {
      items = [
        'تسجيل الدخول',
        'إنشاء حساب',
        'الرئيسية',
        'خدماتنا',
        "طلباتي",
        'طلبات'
      ];
    } else {
      items = ['الرئيسية', 'خدماتنا', "طلباتي", 'طلبات'];
    }
  }

  late List<String> items;
  @override
  Widget build(BuildContext context) {
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
