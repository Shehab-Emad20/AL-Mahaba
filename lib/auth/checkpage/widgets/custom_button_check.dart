import 'package:flutter/material.dart';

class CustomButtonCheck extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;

  const CustomButtonCheck({
    super.key,
    required this.isLoading,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive font size
        double fontSize = constraints.maxWidth > 600 ? 20 : 
                          constraints.maxWidth < 350 ? 14 : 18;

        return isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    width ?? constraints.maxWidth * 0.8, 
                    50
                  ),
                  backgroundColor: Colors.red, // لون الخلفية
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // حواف دائرية
                  ),
                ),
                child: Text(
                  "تحقق",
                  style: TextStyle(
                    fontSize: fontSize, 
                    color: Colors.white
                  ),
                ),
              );
      },
    );
  }
}
