import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconLeft;
  final IconData iconRight;

  const CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconLeft,
    required this.iconRight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50, // تغيير اللون حسب الرغبة
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // سهم (Arrow) في الجهة اليسرى
            Icon(
              iconLeft, // أيقونة ديناميكية على اليسار
              size: 30,
              color: Colors.black,
            ),

            // النص في المنتصف
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end, // محاذاة النصوص لليمين
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right, // محاذاة النص لليمين
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right, // محاذاة النص لليمين
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // أيقونة في الجهة اليمنى
            Icon(
              iconRight, // أيقونة ديناميكية على اليمين
              size: 30,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}