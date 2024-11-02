import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widget/views_sing_up/signUp_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: SignupForm(),
    );
  }
}
