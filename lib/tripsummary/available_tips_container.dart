import 'package:flutter/material.dart';

class AvailableTripsContainer extends StatelessWidget {
  const AvailableTripsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // مسافة حول الContainer
      child: Container(
        padding: const EdgeInsets.all(16.0), // مسافة داخلية للـ Container
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 167, 167), // لون الخلفية
          borderRadius: BorderRadius.circular(10), // زوايا مستديرة
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ], // تأثير الظل
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end, // محاذاة النص لليمين
          children: [
            Text(
              'الرحلات المتاحة',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black, // لون النص
              ),
              textAlign: TextAlign.right, // محاذاة النص لليمين
            ),
            SizedBox(height: 8), // مسافة بين العناوين والنص
            Text(
              'يتم إضافة رحلات جديدة باستمرار حسب طلبات العملاء',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // لون النص الثاني
              ),
              textAlign: TextAlign.right, // محاذاة النص لليمين
            ),
          ],
        ),
      ),
    );
  }
}
