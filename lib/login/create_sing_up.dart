import 'package:almahaba/singup/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateSignUp extends StatelessWidget {
  const CreateSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // محاذاة النص لليمين
      child: RichText(
        text: TextSpan(
          text: 'ليس لديك حساب؟ ',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: 'إنشاء حساب',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
