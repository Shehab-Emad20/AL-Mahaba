import 'package:almahaba/auth/login/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateLoginPage extends StatelessWidget {
  const CreateLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // محاذاة النص لليمين
      child: RichText(
        text: TextSpan(
          text: 'ليس لديك بالفعل؟ ',
          style: const TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: 'قم بتسجيل الدخول',
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
                      builder: (context) => const LoginPage(),
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
