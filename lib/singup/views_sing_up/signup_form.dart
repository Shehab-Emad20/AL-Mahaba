import 'package:almahaba/singup/views_sing_up/signup_page.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SignupForm(),
    );
  }
}
