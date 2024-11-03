import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(context),
          ..._buildDrawerItems(context),
        ],
      ),
    );
  }

  // دالة لبناء رأس القائمة الجانبية
  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      child: Row(
        children: [
          Expanded(
            child: Text(
              'AL-MAHABA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              // إغلاق القائمة
              Navigator.pop(context);
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
  }

  // دالة لبناء عناصر القائمة الجانبية
  List<Widget> _buildDrawerItems(BuildContext context) {
    final items = [
      'تسجيل الدخول',
      'إنشاء حساب',
      'الرئيسية',
      'خدماتنا',
      'طلبات',
    ];

    return items.map((item) {
      return ListTile(
        title: Text(item),
        onTap: () {
          // تنفيذ العملية المناسبة بناءً على العنصر المحدد
          print('تم الضغط على $item');
          Navigator.pop(context); // إغلاق القائمة
        },
      );
    }).toList();
  }
}
