import 'dart:developer';
import 'package:almahaba/Submit%20a%20quote/view.dart';
import 'package:almahaba/auth/login/view.dart';
import 'package:almahaba/auth/signup/view.dart';
import 'package:almahaba/services/view.dart';
import 'package:almahaba/tripsummary/widgets/custom_form.dart';
import 'package:flutter/material.dart';

class NavigationHandler {
  static void handleNavigation(BuildContext context, String item) {
    Navigator.pop(context); // Close the sidebar menu

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
        // No action is needed for "الرئيسية"
        break;
      case 'خدماتنا':
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ViewBodyServices()));
        break;
      case 'طلباتي':
        // Ensure the class name is correct and imported
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                  const  ViewBody())); // Corrected the spelling of `ViewBody`
        break;
      case 'طلبات':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const CustomForm(
                      ShowOrder: [], // Ensure `ShowOrder` is a valid parameter
                    )));
        break;
      default:
        log('Unknown item: $item');
        break;
    }
  }
}
