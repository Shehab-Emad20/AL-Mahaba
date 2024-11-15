import 'dart:developer';

import 'package:almahaba/login/views_login_page/login_page.dart';
import 'package:almahaba/servies/body_sevices.dart';
import 'package:almahaba/singup/views_sing_up/signup_form.dart';
import 'package:flutter/material.dart';

class NavigationHandler {
  static void handleNavigation(BuildContext context, String item) {
    Navigator.pop(context); // إغلاق القائمة الجانبية

    switch (item) {
      case 'تسجيل الدخول':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginPage()));
        break;
      case 'إنشاء حساب':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const SignupPage()));
        break;
      case 'الرئيسية':
        // الانتقال إلى الصفحة الرئيسية
        break;
      case 'خدماتنا':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const BodySevices()));
        break;
      case 'طلبات':
        // الانتقال إلى صفحة الطلبات
        break;
      default:
        log('العنصر غير معروف: $item');
        break;
    }
  }
}
