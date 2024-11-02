import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widget/views_sing_up/signUp_page.dart';
import 'package:flutter/material.dart';

class CutomeText extends StatelessWidget {
  const CutomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'ليس لديك حساب؟ ',
          style: TextStyle(
            fontSize: 16,
            color: kBlackColor,
          ),
        ),
        TextButton(
          onPressed: () {
            // هنا يمكنك توجيه المستخدم إلى صفحة إنشاء الحساب
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupPage()),
            );
          },
          child: const Text(
            'إنشاء حساب',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
