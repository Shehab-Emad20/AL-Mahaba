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
          // هنا يمكن إضافة وظيفة إعادة تعيين كلمة المرور
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
