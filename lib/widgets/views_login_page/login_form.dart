import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widgets/views_login_page/elevated_button.dart';
import 'package:almahaba/widgets/views_login_page/header_text.dart';
import 'package:almahaba/widgets/views_login_page/input_field.dart';
import 'package:almahaba/widgets/views_login_page/text_widget.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      width: 370,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          HeaderText(
            title: 'تسجيل الدخول',
            fontSize: 35,
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          HeaderText(
            title: 'سجل دخولك لاستكساف خدمات جديده',
            fontSize: 15,
            color: kPrimaryColor,
          ),
          SizedBox(height: 20),
          InputField(
            hintText: 'البريد الالكتروني',
            icon: Icons.email,
          ),
          SizedBox(height: 10),
          InputField(
            hintText: 'كلمة المرور',
            icon: Icons.lock,
          ),
          SizedBox(height: 20),
          TextWidget(),
          SizedBox(height: 20), // مساحة بين الزر وحقول الإدخال
          ElevateTextdButton(),
        ],
      ),
    );
  }
}
