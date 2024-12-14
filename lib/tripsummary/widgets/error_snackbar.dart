import 'package:flutter/material.dart';

class ErrorSnackbar {
  static void show(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('حدث خطأ: $error'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
