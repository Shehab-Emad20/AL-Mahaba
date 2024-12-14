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
        context,
        MaterialPageRoute(builder: (context) => const BodyPage()),
      );
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
                      title: 'تسجيل الدخول',
                      fontSize: headerFontSize,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    HeaderText(
                      title: 'سجل دخولك لاستكشاف خدمات جديدة',
                      fontSize: subHeaderFontSize,
                      color: kPrimaryColor,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),

                    // Email TextField
                    CustomTextFieldlogin(
                      controller: _emailController,
                      hint: 'البريد الإلكتروني',
                      obscureText: false,
                      icon: Icons.email,
                      text: 'shehabzanati25@gmail.com',
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),

                    // Password TextField
                    CustomTextFieldlogin(
                      controller: _passwordController,
                      hint: 'كلمة المرور',
                      obscureText: true,
                      icon: Icons.lock,
                      text: 'shehab2014',
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),

                    const CustomButtonFrogotPassword(),
                    SizedBox(height: constraints.maxHeight * 0.02),

                    LoginButton(
                      isLoading: _isLoading,
                      onPressed: _login,
                      width: constraints.maxWidth * (isTablet ? 0.6 : 0.8),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    const CreateSignUp()
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
