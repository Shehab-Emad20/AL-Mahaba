import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class DividerThinkness extends StatelessWidget {
  const DividerThinkness({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(thickness: 1, color: kPrimaryColor), // خط أفقي
          ),
          SizedBox(width: 8), // إضافة مسافة بين الخط والجملة
          Text(
            'تسجيل دخول عبر',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(width: 6), // إضافة مسافة بين الجملة والخط
          Expanded(
            child: Divider(thickness: 1, color: kPrimaryColor), // خط أفقي
          ),
        ],
      ),
    );
  }
}
