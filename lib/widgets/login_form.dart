import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widgets/views_login_page/elevated_button.dart';
import 'package:almahaba/widgets/views_login_page/header_text.dart';
import 'package:almahaba/widgets/views_login_page/input_field.dart';
import 'package:almahaba/widgets/views_login_page/text_widget.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.7, // Responsive height
      width: screenSize.width * 0.9, // Responsive width
      decoration: BoxDecoration(
        color: kwhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenSize.height * 0.04), // Dynamic spacing
            const HeaderText(
                title: 'تسجيل الدخول',
                fontSize: 35,
                color: kBlackColor,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            const HeaderText(
                title: 'سجل دخولك لاستكساف خدمات جديده',
                fontSize: 15,
                color: kPrimaryColor),
            const SizedBox(height: 20),
            // Row for email and password fields
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05), // Horizontal padding
              child: Column(
                children: [
                  const InputField(
                      hintText: 'البريد الالكتروني', icon: Icons.email),
                  SizedBox(
                      height:
                          screenSize.height * 0.02), // Spacing between fields
                  const InputField(hintText: 'كلمة المرور', icon: Icons.lock),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const TextWidget(),
            const SizedBox(height: 20),
            const ElevateTextdButton(),
          ],
        ),
      ),
    );
  }
}
