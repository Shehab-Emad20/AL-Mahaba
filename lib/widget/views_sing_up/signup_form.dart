import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widgets/views_login_page/header_text.dart';
import 'package:almahaba/widgets/views_login_page/input_field.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // يمكنك تعديل الارتفاع إذا احتجت
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
            title: "إنشاء حساب",
            fontSize: 35,
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          HeaderText(
            title: "قم بإنشاء حساب لاستكشاف الخدمات الجديدة",
            fontSize: 15,
            color: kPrimaryColor,
          ),
          SizedBox(height: 20),

          // حقل الاسم الأول واسم العائلة
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2, // يمكن تغيير القيمة حسب الحجم المرغوب
                  child: InputField(
                    hintText: 'الاسم الأول',
                    icon: Icons.person,
                  ),
                ),
                SizedBox(width: 8), // تقليل المسافة بين الحقلين
                Expanded(
                  flex: 2, // يمكن تغيير القيمة حسب الحجم المرغوب
                  child: InputField(
                    hintText: 'اسم العائلة',
                    icon: Icons.person,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          InputField(
            hintText: 'البريد الإلكتروني',
            icon: Icons.email,
          ),
          SizedBox(height: 10),
          InputField(
            hintText: 'كلمة المرور',
            icon: Icons.lock,
          ),
          SizedBox(height: 10),
          InputField(
            hintText: "تأكيد كلمه المرور",
            icon: Icons.visibility,
          ),
          // ElevatedTextButton(
          //   // تأكد من أن لديك هذا الزر في مكانه المناسب
          //   onPressed: () {
          //     // هنا يمكنك إضافة وظيفة لإنشاء الحساب
          //   },
        ],
      ),
    );
  }
}
