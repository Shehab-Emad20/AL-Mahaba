import 'package:almahaba/auth/emails/api_servcies_send_email.dart';
import 'package:almahaba/auth/checkpage/view.dart';
import 'package:almahaba/auth/emails/widgets/custom_button_send.dart';
import 'package:almahaba/auth/emails/widgets/custom_text_feild_email_for_forgot.dart';
import 'package:almahaba/auth/login/widgets/header_text.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/auth/emails/send_email.dart'; // تأكد من أنك قد أضفت النموذج بشكل صحيح

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendEmail() async {
    final email = _emailController.text.trim();

    // التحقق من وجود البريد الإلكتروني
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.cancel, color: Colors.white),
              SizedBox(width: 8),
              Text("Please enter an email."),
            ],
          ),
          backgroundColor: Colors.red, // لون الأحمر عند وجود خطأ
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // الاتصال بـ API لإرسال البريد الإلكتروني
      APIServicesendemail apiService = APIServicesendemail();
      ForgotPasswordResponseModel response =
          await apiService.forgotPassword(email);

      // عرض رسالة النجاح مع رمز ✅
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 8),
              Text(response.message),
            ],
          ),
          backgroundColor: Colors.green, // لون الأخضر عند النجاح
        ),
      );

      // الانتقال إلى صفحة التحقق من الرمز بعد إرسال البريد
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CheckCodePage(email: email)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.cancel, color: Colors.white),
              const SizedBox(width: 8),
              Text("Error: $e"),
            ],
          ),
          backgroundColor: Colors.red, // لون الأحمر عند حدوث خطأ
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
        double headerFontSize = isTablet ? 35 : (isSmallDevice ? 20 : 24);
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
                    SizedBox(height: constraints.maxHeight * 0.02),
                    HeaderText(
                      title: "أدخل البريد الألكتروني",
                      fontSize: headerFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    CustomTextFeildEmailForForgot(
                      emailController: _emailController,
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    CustomButtonSend(
                      isLoading: _isLoading,
                      onPressed: _sendEmail,
                      width: constraints.maxWidth * (isTablet ? 0.6 : 0.8),
                    ),
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
