import 'package:almahaba/Forgot%20Password/custom_enter_email.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // محاذاة الزر إلى اليمين
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CustomEnterEmail()),
          );
        },
        child: const Text(
          "هل نسيت كلمة المرور؟",
          style: TextStyle(
            color: kBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
