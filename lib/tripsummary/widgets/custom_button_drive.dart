import 'package:almahaba/Submit%20a%20quote/view.dart';
import 'package:almahaba/home/widgets/view_page.dart';
import 'package:flutter/material.dart';

class CustomButtonAddDrive extends StatelessWidget {
  const CustomButtonAddDrive({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight, // محاذاة الزر لليمين
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        const ViewBody()), // استخدم الصفحة المناسبة
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // لون الخلفية
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // حواف دائرية
              ),
            ),
            child: const Text(
              "تقديم عرض سعر",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ));
  }
}
