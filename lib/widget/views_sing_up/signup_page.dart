import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widgets/views_login_page/custom_button.dart';
import 'package:almahaba/widgets/views_login_page/divider_thinkness.dart';
import 'package:almahaba/widgets/views_login_page/header_text.dart';
import 'package:almahaba/widgets/views_login_page/input_field.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 580, // التأكد من أن الارتفاع متطابق
        width: 370, // التأكد من أن العرض متطابق
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start, // العناصر للأعلى
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
            // صف لحقل الاسم الأول واسم العائلة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child:
                      InputField(hintText: 'الاسم الأول', icon: Icons.person),
                ),
                SizedBox(width: 10), // المسافة بين الحقلين
                Expanded(
                  child:
                      InputField(hintText: 'اسم العائلة', icon: Icons.person),
                ),
              ],
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
            )
          ],
        ),
      ),
    );
  }
}
