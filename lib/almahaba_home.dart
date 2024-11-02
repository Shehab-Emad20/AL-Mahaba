import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widgets/views_login_page/login_form.dart';
import 'package:flutter/material.dart';

class AlmahabaHome extends StatelessWidget {
  const AlmahabaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
