import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Form")),
      body: Center(child: Text("This is the Custom Form page")),
    );
  }
}
