import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widget/views_sing_up/custom_button_singup.dart';
import 'package:almahaba/widgets/views_login_page/custom_button.dart';
import 'package:almahaba/widgets/views_login_page/custom_icons.dart';
import 'package:almahaba/widgets/views_login_page/divider_thinkness.dart';
import 'package:almahaba/widgets/views_login_page/header_text.dart';
import 'package:almahaba/widgets/views_login_page/input_field.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: screenSize.height * 0.75, // Make height responsive
        width: screenSize.width * 0.9, // Make width responsive
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const SingleChildScrollView(
          // Added scroll view for responsiveness
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align items at the top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              HeaderText(
                title: "إنشاء حساب",
                fontSize: 35,
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              HeaderText(
                title: "قم بإنشاء حساب لاستكشاف الخدمات الجديده",
                fontSize: 15,
                color: kPrimaryColor,
              ),
              SizedBox(height: 20),
              // Row for first name and last name fields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InputField(
                          hintText: 'الاسم الأول', icon: Icons.person),
                    ),
                    SizedBox(width: 10), // Space between fields
                    Expanded(
                      child: InputField(
                          hintText: 'اسم العائلة', icon: Icons.person),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InputField(hintText: 'البريد الالكتروني', icon: Icons.email),
              SizedBox(height: 10),
              InputField(hintText: 'كلمة المرور', icon: Icons.lock),
              SizedBox(height: 10),
              InputField(hintText: 'تأكيد كلمة المرور', icon: Icons.lock),
              SizedBox(height: 20),
              CustomButton(textbutton: 'إنشاء حساب'),
              SizedBox(height: 20),
              DividerThinkness(
                text: 'أو التسجبل باستخدام ',
              ),
              SizedBox(height: 20),
              CustomIcons(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Custombuttonsingup(),
            ],
          ),
        ),
      ),
    );
  }
}
