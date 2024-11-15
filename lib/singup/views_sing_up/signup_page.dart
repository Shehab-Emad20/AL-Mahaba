import 'package:almahaba/login/views_login_page/custom_button.dart';
import 'package:almahaba/login/views_login_page/custom_icons.dart';
import 'package:almahaba/login/views_login_page/divider_thinkness.dart';
import 'package:almahaba/login/views_login_page/header_text.dart';
import 'package:almahaba/login/views_login_page/input_field.dart';
import 'package:almahaba/singup/views_sing_up/custom_button_singup.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        padding: EdgeInsets.all(
            screenSize.width * 0.04), // Padding around the container
        height: screenSize.height * 0.76,
        width: screenSize.width * 0.96,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.04),
              HeaderText(
                title: "إنشاء حساب",
                fontSize: screenSize.width * 0.08,
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: screenSize.height * 0.01),
              HeaderText(
                title: "قم بإنشاء حساب لاستكشاف الخدمات الجديدة",
                fontSize: screenSize.width * 0.03,
                color: kPrimaryColor,
              ),

              SizedBox(height: screenSize.height * 0.02),
              // Row for first name and last name fields
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
                child: Row(
                  children: [
                    const Expanded(
                      child: InputField(
                        hintText: 'الاسم الأول',
                        icon: Icons.person,
                      ),
                    ),
                    SizedBox(
                        width: screenSize.width * 0.03), // Space between fields
                    const Expanded(
                      child: InputField(
                        hintText: 'اسم العائلة',
                        icon: Icons.person,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              const InputField(
                  hintText: 'البريد الالكتروني', icon: Icons.email),
              SizedBox(height: screenSize.height * 0.01),
              const InputField(hintText: 'كلمة المرور', icon: Icons.lock),
              SizedBox(height: screenSize.height * 0.01),
              const InputField(hintText: 'تأكيد كلمة المرور', icon: Icons.lock),
              SizedBox(height: screenSize.height * 0.02),
              const CustomButton(textbutton: 'إنشاء حساب'),
              SizedBox(height: screenSize.height * 0.02),
              const DividerThinkness(text: 'أو التسجيل باستخدام '),
              SizedBox(height: screenSize.height * 0.02),
              const CustomIcons(),
              SizedBox(height: screenSize.height * 0.02),
              const Custombuttonsingup(),
            ],
          ),
        ),
      ),
    );
  }
}
