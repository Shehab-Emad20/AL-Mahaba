import 'package:flutter/material.dart';

class CustomButttonSumaary extends StatelessWidget {
  const CustomButttonSumaary({super.key, required this.onPressed, required this.buttonText});
  final VoidCallback onPressed;
  final String buttonText; // Add a new field for the button text

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
      child: SizedBox(
        width: 370, // تحديد عرض الزر هنا (يمكنك تعديل القيمة حسب الحاجة)
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // لون الخلفية
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // حواف دائرية
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 15), // تعديل الحشو الداخلي للزر
          ),
          child:  Text(
         buttonText ,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
