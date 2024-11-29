import 'package:almahaba/tripsummary/form/data%20from/page_data_form.dart';
import 'package:flutter/material.dart';

class CustomButttonSumaary extends StatelessWidget {
  const CustomButttonSumaary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
      child: SizedBox(
        width: 370, // تحديد عرض الزر هنا (يمكنك تعديل القيمة حسب الحاجة)
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PageDataForm()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // لون الخلفية
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // حواف دائرية
            ),
            padding:
                EdgeInsets.symmetric(vertical: 15), // تعديل الحشو الداخلي للزر
          ),
          child: const Text(
            "التالي",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
