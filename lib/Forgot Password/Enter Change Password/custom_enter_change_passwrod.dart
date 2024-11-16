import 'package:almahaba/Forgot%20Password/email_text_field.dart';
import 'package:almahaba/Forgot%20Password/label_text.dart';
import 'package:almahaba/Forgot%20Password/submit_button.dart';
import 'package:almahaba/login/views_login_page/login_form.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomEnterChangePasswrod extends StatelessWidget {
  const CustomEnterChangePasswrod({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kScaffoldColor, // لون الخلفية
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9, // العرض متجاوب بناءً على العرض الكلي
          child: Container(
            height: screenSize.height * 0.37, // ضبط الارتفاع بناءً على الشاشة
            decoration: BoxDecoration(
              color: kwhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // النص التوجيهي
                const LabelText(text: 'Enter New Password'),
                const SizedBox(height: 10), // إضافة مسافة بين النص وحقل الإدخال

                // حقل الإدخال (TextField)
                const EmailTextField(
                  hintText: 'New Password',
                ),
                const EmailTextField(
                  hintText: 'Confirm Password',
                ),
                // الزر
                SubmitButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginForm()),
                    );
                  },
                  text: 'Change Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
