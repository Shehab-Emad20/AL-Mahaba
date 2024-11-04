import 'package:almahaba/login/views_login_page/social_button%20.dart';
import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // حواف لجعل الأزرار في المنتصف
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // توزيع الأزرار بشكل متساوٍ
        children: [
          SocialButton(
            icon: Icons.g_mobiledata, // أيقونة جوجل
            label: 'Google',
            color: Colors.red, // اللون الرسمي لجوجل
            onPressed: () {
              // print('Google button pressed');
            },
          ),
          SocialButton(
            icon: Icons.facebook, // أيقونة فيسبوك
            label: 'Facebook',
            color: Colors.blue, // اللون الرسمي لفيسبوك
            onPressed: () {
              //print('Facebook button pressed');
            },
          ),
          SocialButton(
            icon: Icons.apple, // أيقونة آبل
            label: 'Apple',
            color: Colors.black, // اللون الرسمي لآبل
            onPressed: () {
              //  print('Apple button pressed');
            },
          ),
        ],
      ),
    );
  }
}
