import 'package:almahaba/auth/login/widgets/create_sing_up.dart';
import 'package:almahaba/auth/login/widgets/custom_buttonfrogot_password.dart';
import 'package:almahaba/auth/login/widgets/custom_ioading_indicator.dart';
import 'package:almahaba/auth/login/widgets/custom_textfield.dart';
import 'package:almahaba/auth/login/widgets/header_text.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/home/body_page.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/auth/login/api_service.dart';
import 'package:almahaba/auth/login/model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final requestModel = LoginRequestModel(
      email: _emailController.text, // Replace with correct fields
      password: _passwordController.text, // Replace with correct fields
    );

    try {
      final apiService = APIServiceLogin();
      await apiService.login(requestModel);

      // Show success Snackbar
      _showSnackbar(
        context,
        message: "تم تسجيل الدخول بنجاح",
        color: Colors.green,
        icon: Icons.check_circle,
      );

      // Navigate to home page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BodyPage()));
    } catch (e) {
      // Show error Snackbar
      _showSnackbar(
        context,
        message: " فشل تسجيل الدخول: $e",
        color: Colors.red,
        icon: Icons.error,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

// Helper method to show Snackbar
  void _showSnackbar(BuildContext context,
      {required String message, required Color color, required IconData icon}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
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
                  title: 'تسجيل الدخول',
                  fontSize: 35,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                const HeaderText(
                  title: 'سجل دخولك لاستكشاف خدمات جديدة',
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
                const SizedBox(height: 20),

                // حقل البريد الإلكتروني مع أيقونة
                CustomTextFieldlogin(
                    controller: _emailController,
                    hint: 'البريد الإلكتروني',
                    obscureText: false,
                    icon: Icons.email,
                    text: 'shehabzanati25@gmail.com'),
                const SizedBox(height: 20),

                // حقل كلمة المرور مع أيقونة
                CustomTextFieldlogin(
                    controller: _passwordController,
                    hint: 'كلمة المرور',
                    obscureText: true,
                    icon: Icons.lock,
                    text: 'shehab2014'),
                const SizedBox(height: 20),

                // رابط هل نسيت كلمة المرور؟
                const CustomButtonFrogotPassword(), // This is now above the login button

                // زر تسجيل الدخول
                const SizedBox(height: 20),
                LoginButton(
                  isLoading: _isLoading,
                  onPressed: _login,
                ),
                const SizedBox(height: 20),
                const CreateSignUp()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
