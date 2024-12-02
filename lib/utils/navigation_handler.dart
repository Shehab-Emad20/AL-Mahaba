import 'dart:developer';
import 'package:almahaba/auth/login/view.dart';
import 'package:almahaba/services/view.dart';
import 'package:almahaba/auth/signup/view.dart';
import 'package:almahaba/tripsummary/widgets/view.dart';
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
        break;
      case 'خدماتنا':
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ViewBodyServices()));
        break;
      case 'طلبات':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const CustomForm()));
        break;
      default:
        log('العنصر غير معروف: $item');
        break;
    }
  }
}
