import 'dart:developer';
import 'package:almahaba/auth/ResetPasswordPage/widgets/custom_button_reset_password.dart';
import 'package:almahaba/auth/ResetPasswordPage/widgets/custom_text_field_conffim_password.dart';
import 'package:almahaba/auth/login/widgets/header_text.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/auth/ResetPasswordPage/api_servies_reset_password.dart'; // تأكد من هذه الفئة
import 'package:almahaba/auth/login/view.dart'; // تأكد من أنك قد أضفت نموذج صفحة تسجيل الدخول

class ResetPasswordPage extends StatefulWidget {
  final String email;

  const ResetPasswordPage(
      {super.key, required this.email}); // إزالة `code` من المتغيرات

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // حقل لتأكيد كلمة المرور
  bool _isLoading = false;

  // دالة إعادة تعيين كلمة المرور
  Future<void> _resetPassword() async {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.cancel, color: Colors.white), // ❌
                SizedBox(width: 8),
                Text("الرجاء إدخال كلا الحقلين كلمة المرور."),
              ],
            ),
            backgroundColor: Colors.red, // لون الأحمر عند حدوث خطأ
          ),
        );
      }
      return;
    }

    if (newPassword != confirmPassword) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.cancel, color: Colors.white), // ❌
                SizedBox(width: 8),
                Text("كلمات المرور غير متطابقة."),
              ],
            ),
            backgroundColor: Colors.red, // لون الأحمر عند حدوث خطأ
          ),
        );
      }
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      APIServiceResetPassword apiService = APIServiceResetPassword();
      ResetPasswordResponseModel response = await apiService.resetPassword(
          widget.email, newPassword); // إرسال البريد وكلمة المرور فقط

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white), // ✅
                const SizedBox(width: 8),
                Text(response.message), // رسالة النجاح بالعربية
              ],
            ),
            backgroundColor: Colors.green, // لون الأخضر عند النجاح
          ),
        );
      }

      // الانتقال إلى صفحة تسجيل الدخول بعد النجاح
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    } catch (e) {
      if (mounted) {
        // إذا كان هناك خطأ في الاتصال أو غيره
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.cancel, color: Colors.white), // ❌
                const SizedBox(width: 8),
                Text("حدث خطأ: $e"), // رسالة الخطأ بالعربية
              ],
            ),
            backgroundColor: Colors.red, // لون الأحمر عند حدوث خطأ
          ),
        );
      }
      // سجل الخطأ في حال كان من نوع DioException
      if (e is DioException) {
        if (e.response != null) {
          log('Error Response: ${e.response?.data}');
          log('Error Status Code: ${e.response?.statusCode}');
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
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
              children: [
                const HeaderText(
                  title: 'تغير كلمة المرور',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 16),
                CustomTextFieldConffimPassword(
                    controller: _newPasswordController,
                    obscureText: true,
                    hint: "باسورد جديد"),
                const SizedBox(height: 16),
                CustomTextFieldConffimPassword(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    hint: " تأكيد باسورد"),
                const SizedBox(height: 16),
                CustomButtonResetPassword(
                  isLoading: _isLoading,
                  onPressed: _resetPassword,
                )
              ],
            ),
          ),
        )));
  }
}
