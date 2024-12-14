import 'package:almahaba/auth/ResetPasswordPage/widgets/custom_button_reset_password.dart';
import 'package:almahaba/auth/ResetPasswordPage/widgets/custom_text_field_conffim_password.dart';
import 'package:almahaba/auth/login/widgets/header_text.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class ResetPasswordResponseModel {
  final String message;

  ResetPasswordResponseModel({required this.message});

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      message: json['message'],
    );
  }
}

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() {
    // Implement your reset password logic here
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
                    HeaderText(
                      title: 'تغير كلمة المرور',
                      fontSize: headerFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    CustomTextFieldConffimPassword(
                      controller: _newPasswordController,
                      obscureText: true,
                      hint: "باسورد جديد",
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    CustomTextFieldConffimPassword(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      hint: " تأكيد باسورد",
                      fontSize: inputFontSize,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    CustomButtonResetPassword(
                      isLoading: _isLoading,
                      onPressed: _resetPassword,
                      width: constraints.maxWidth * (isTablet ? 0.6 : 0.8),
                    )
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
