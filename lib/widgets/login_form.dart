import 'package:almahaba/widgets/header_text.dart';
import 'package:almahaba/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      width: 325,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 30),
          HeaderText(
            title: 'تسجيل الدخول',
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          HeaderText(
            title: 'سجل دخولك لاستكساف خدمات جديده',
            fontSize: 15,
            color: Colors.grey,
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
        ],
      ),
    );
  }
}
