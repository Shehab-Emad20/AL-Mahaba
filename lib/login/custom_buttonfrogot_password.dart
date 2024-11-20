import 'package:almahaba/emails/send_email.dart';
import 'package:almahaba/utils/constants.dart';

import 'package:flutter/material.dart';

class CustomButtonFrogotPassword extends StatelessWidget {
  const CustomButtonFrogotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgotPasswordPage(),
            ),
          );
        },
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "هل نسيت كلمة المرور؟",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
