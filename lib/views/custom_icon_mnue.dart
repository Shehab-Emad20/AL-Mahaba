import 'package:flutter/material.dart';

class CustomIconMnue extends StatelessWidget {
  const CustomIconMnue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.red,
        ), // أيقونة التنقل
        onPressed: () {
          // يمكنك إضافة ما يحدث عند الضغط على الأيقونة هنا
          print('تم الضغط على أيقونة القائمة');
        },
      ),
    );
  }
}
