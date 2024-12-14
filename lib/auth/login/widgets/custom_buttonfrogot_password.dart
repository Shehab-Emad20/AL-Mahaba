import 'package:almahaba/auth/emails/view.dart';
import 'package:almahaba/utils/constants.dart';

import 'package:flutter/material.dart';

class CustomButtonFrogotPassword extends StatelessWidget {
  const CustomButtonFrogotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive font size
        double fontSize = constraints.maxWidth > 600 ? 20 : 
                          constraints.maxWidth < 350 ? 14 : 18;

        return Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordPage(),
                ),
              );
            },
            child: Text(
              "هل نسيت كلمة المرور؟",
              style: TextStyle(
                color: kBlackColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
