import 'package:almahaba/auth/ResetPasswordPage/view.dart';
import 'package:almahaba/auth/checkpage/api_servcies_check_code.dart';
import 'package:almahaba/auth/checkpage/widgets/custom_button_check.dart';
import 'package:almahaba/auth/checkpage/widgets/custom_text_feild_email_for_check.dart';
import 'package:almahaba/auth/login/widgets/header_text.dart';
import 'package:almahaba/auth/checkpage/checkcode._models.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CheckCodePage extends StatefulWidget {
  final String email;

  const CheckCodePage({super.key, required this.email});

  @override
  // ignore: library_private_types_in_public_api
  _CheckCodePageState createState() => _CheckCodePageState();
}

class _CheckCodePageState extends State<CheckCodePage> {
  final TextEditingController _codeController = TextEditingController();
  bool _isLoading = false;

  // الدالة للتحقق من الكود
  Future<void> _verifyCode() async {
    final code = _codeController.text.trim(); // استلام الكود المدخل
    if (code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("الرجاء إدخال كود التحقق."),
          backgroundColor: Colors.red, // لون الأحمر عند وجود خطأ
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      APIServicecheckcode apiService = APIServicecheckcode();

      // إرسال البريد الإلكتروني والكود
      VerificationResponseModel response =
          await apiService.verifyCode(widget.email, code);

      // إذا تم التحقق بنجاح، عرض رسالة مع رمز ✅ ولون أخضر
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 8),
              Text(response.message), // الرسالة من الـ API
            ],
          ),
          backgroundColor: Colors.green, // لون الأخضر عند النجاح
        ),
      );

      // بعد التحقق بنجاح، ننتقل إلى صفحة إعادة تعيين كلمة المرور
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordPage(
              email: widget.email), // إرسال البريد الإلكتروني فقط
        ),
      );
    } catch (e) {
      // إذا كان هناك خطأ، عرض رسالة مع رمز ❌ ولون أحمر
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.cancel, color: Colors.white),
              const SizedBox(width: 8),
              Text("خطأ: $e"), // الرسالة بالخطأ
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
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kScaffoldColor,
        body: Center(
            child: Container(
          height: screenSize.height * 0.3, // Responsive height
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
              children: [
                SizedBox(height: screenSize.height * 0.04), // Dynamic spacing

                const HeaderText(
                  title: "أدخل رمز التحقق ",
                  fontSize: 24,
                ),
                CustomTextFeildEmailForCheck(
                  emailController: _codeController,
                ),
                const SizedBox(height: 16),
                CustomButtonCheck(
                  isLoading: _isLoading,
                  onPressed: _verifyCode,
                ),
              ],
            ),
          ),
        )));
  }
}
