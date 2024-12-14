import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;

  const LoginButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                width ?? screenSize.width * 0.8, 
                50
              ),
              backgroundColor: Colors.red, // لون الخلفية
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // حواف دائرية
              ),
            ),
            child: const Text(
              "تسجيل دخول",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
  }
}
