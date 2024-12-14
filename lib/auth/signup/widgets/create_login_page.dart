import 'package:almahaba/auth/login/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateLoginPage extends StatelessWidget {
  const CreateLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive font sizes
        double fontSize = constraints.maxWidth > 600 ? 20 : 
                          constraints.maxWidth < 350 ? 14 : 16;

        return Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: TextSpan(
              text: 'ليس لديك بالفعل؟ ',
              style: TextStyle(
                color: Colors.black, 
                fontSize: fontSize,
              ),
              children: [
                TextSpan(
                  text: 'قم بتسجيل الدخول',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: fontSize,
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
      },
    );
  }
}
