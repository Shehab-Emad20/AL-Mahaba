import 'package:flutter/material.dart';

class CustomButtonCheck extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const CustomButtonCheck({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenSize.width * 0.8, 50),
              backgroundColor: Colors.red, // لون الخلفية
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // حواف دائرية
              ),
            ),
            child: const Text(
              "تحقق",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
  }
}
