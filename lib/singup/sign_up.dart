import 'package:almahaba/login/header_text.dart';
import 'package:almahaba/login/login_form.dart';
import 'package:almahaba/singup/create_login_page.dart';
import 'package:almahaba/singup/custom_text_field_sing_up.dart';
import 'package:almahaba/singup/cutom_button_sinup_login.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signup() async {
    setState(() {
      _isLoading = true;
    });

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // التحقق من الحقول الفارغة
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Text("الرجاء ملء جميع الحقول"),
            ],
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Text("كلمة السر وتأكيد كلمة السر غير متطابقين"),
            ],
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final requestModel = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text("تم التسجيل بنجاح"),
            ],
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginPage()), // استخدم الصفحة المناسبة
      );
    } catch (e) {
      // عرض Snackbar في حالة حدوث خطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 10),
              Text("حدث خطأ أثناء التسجيل: $e"),
            ],
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kScaffoldColor,
        body: Center(
            child: Container(
          height: screenSize.height * 0.7, // Responsive height
          width: screenSize.width * 0.9, // Responsive width
          decoration: BoxDecoration(
            color: kwhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05, // Horizontal padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.04), // Dynamic spacing
                const HeaderText(
                  title: 'إنشاء حساب',
                  fontSize: 35,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                const HeaderText(
                  title: 'قم بإنشاء حساب لاستكشاف الخدمات الجديده',
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // توزيع الحقول بالتساوي
                  children: [
                    Expanded(
                      child: CustomTextFieldSingUp(
                          controller: _firstNameController,
                          obscureText: false,
                          icon: Icons.person,
                          hint: 'اسمك الأول',
                          text: 'ِشهاب'),
                    ),
                    const SizedBox(width: 10), // إضافة مسافة بين الحقول
                    Expanded(
                      child: CustomTextFieldSingUp(
                          controller: _lastNameController,
                          obscureText: false,
                          icon: Icons.person,
                          hint: 'اسم عائلة',
                          text: 'عماد'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextFieldSingUp(
                  controller: _emailController,
                  obscureText: false,
                  icon: Icons.email,
                  hint: 'بريدك الإلكتروني',
                  text: 'shehbzanti25@gmail.com',
                ),
                const SizedBox(height: 10),

                // حقل كلمة المرور باستخدام CustomTextFieldlogin
                CustomTextFieldSingUp(
                    controller: _passwordController,
                    obscureText: true,
                    icon: Icons.lock,
                    hint: 'كلمة المرور',
                    text: 'shehab2014'),
                const SizedBox(height: 10),
                CustomTextFieldSingUp(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    icon: Icons.lock,
                    hint: 'تاكيد كلمة المرور',
                    text: "shehab2014"),
                const SizedBox(height: 20),

                CutomButtonSinupLogin(
                  isLoading: _isLoading,
                  onPressed: _signup,
                ),
                const SizedBox(height: 20),

                const CreateLoginPage()
              ],
            ),
          ),
        )));
  }
}
