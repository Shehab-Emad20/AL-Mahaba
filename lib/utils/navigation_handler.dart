import 'dart:developer';
import 'package:almahaba/login/login_form.dart';
import 'package:almahaba/servies/view_body_services.dart';
import 'package:almahaba/singup/sign_up.dart';
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
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ViewBodyServices()));
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
