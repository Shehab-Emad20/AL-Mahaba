import 'package:almahaba/form/view.dart';
import 'package:flutter/material.dart';

class CustomButtonAdd extends StatelessWidget {
  const CustomButtonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight, // محاذاة الزر لليمين
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => FormPage()), // استخدم الصفحة المناسبة
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // لون الخلفية
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // حواف دائرية
              ),
            ),
            child: const Text(
              "إضافة",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ));
  }
}
