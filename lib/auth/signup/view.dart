import 'package:almahaba/auth/login/widgets/header_text.dart';
import 'package:almahaba/auth/login/view.dart';
import 'package:almahaba/auth/signup/widgets/create_login_page.dart';
import 'package:almahaba/auth/signup/widgets/custom_text_field_sing_up.dart';
import 'package:almahaba/auth/signup/widgets/cutom_button_sinup_login.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine device type based on width
        bool isTablet = constraints.maxWidth > 600;
        bool isSmallDevice = constraints.maxWidth < 350;

        // Responsive font sizes
        double headerFontSize = isTablet ? 45 : (isSmallDevice ? 25 : 35);
        double subHeaderFontSize = isTablet ? 20 : (isSmallDevice ? 12 : 15);
        double inputFontSize = isTablet ? 18 : (isSmallDevice ? 14 : 16);

        return Scaffold(
          backgroundColor: kScaffoldColor,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: constraints.maxWidth * (isTablet ? 0.7 : 0.9),
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.05,
                  vertical: constraints.maxHeight * 0.03,
                ),
                decoration: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeaderText(
                      title: 'إنشاء حساب',
                      fontSize: headerFontSize,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    HeaderText(
                      title: 'قم بإنشاء حساب لاستكشاف الخدمات الجديده',
                      fontSize: subHeaderFontSize,
                      color: kPrimaryColor,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),

                    // First and Last Name Row
                    LayoutBuilder(
                      builder: (context, nameConstraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextFieldSingUp(
                                controller: _firstNameController,
                                obscureText: false,
                                icon: Icons.person,
                                hint: 'اسمك الأول',
                                text: 'ِشهاب',
                                fontSize: inputFontSize,
                              ),
                            ),
                            SizedBox(width: constraints.maxWidth * 0.02),
                            Expanded(
                              child: CustomTextFieldSingUp(
                                controller: _lastNameController,
                                obscureText: false,
                                icon: Icons.person,
                                hint: 'اسم عائلة',
                                text: 'عماد',
                                fontSize: inputFontSize,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),

                    // Email TextField
                    CustomTextFieldSingUp(
                      controller: _emailController,
                      obscureText: false,
                      icon: Icons.email,
                      hint: 'بريدك الإلكتروني',
                      text: 'shehbzanti25@gmail.com',
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),

                    // Password TextField
                    CustomTextFieldSingUp(
                      controller: _passwordController,
                      obscureText: true,
                      icon: Icons.lock,
                      hint: 'كلمة المرور',
                      text: 'shehab2014',
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),

                    // Confirm Password TextField
                    CustomTextFieldSingUp(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      icon: Icons.lock,
                      hint: 'تاكيد كلمة المرور',
                      text: "shehab2014",
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),

                    // Signup Button
                    CutomButtonSinupLogin(
                      isLoading: _isLoading,
                      onPressed: _signup,
                      width: constraints.maxWidth * (isTablet ? 0.6 : 0.8),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),

                    // Create Login Page Link
                    const CreateLoginPage()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
