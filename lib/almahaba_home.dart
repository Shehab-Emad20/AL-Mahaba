import 'package:almahaba/widgets/login_form.dart';
import 'package:flutter/material.dart';

class AlmahabaHome extends StatelessWidget {
  const AlmahabaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white, // Background color for the whole page
          child: const Center(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
