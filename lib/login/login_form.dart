import 'package:almahaba/login/create_sing_up.dart';
import 'package:almahaba/login/custom_buttonfrogot_password.dart';
import 'package:almahaba/login/custom_ioading_indicator.dart';
import 'package:almahaba/login/custom_textfield.dart';
import 'package:almahaba/login/header_text.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/api/api_services.dart';
import 'package:almahaba/models/login_models.dart';

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

    final requestModel = LoginResponeModel(
      token: _emailController.text, // Replace with correct fields
      message: _passwordController.text, // Replace with correct fields
    );

    try {
      final apiService = APIServiceLogin();
      final response = await apiService.login(requestModel);
      // Handle successful login (e.g., navigate to home page)
      throw Exception("Login Successful: ${response.token}");
      // يمكنك إضافة الانتقال إلى الصفحة الرئيسية بعد تسجيل الدخول
    } catch (e) {
      // Handle error (show error message)
      throw Exception("Error: $e");
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
                  label: '',
                ),
                const SizedBox(height: 20),

                // حقل كلمة المرور مع أيقونة
                CustomTextFieldlogin(
                  controller: _passwordController,
                  hint: 'كلمة المرور',
                  obscureText: true,
                  icon: Icons.lock,
                  label: '',
                ),
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
