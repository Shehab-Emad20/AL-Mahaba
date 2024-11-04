import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/widgets/body_form.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: BodyForm(),
    );
  }
}
