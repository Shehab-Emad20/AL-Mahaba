import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconLeft;
  final IconData iconRight;
  final VoidCallback onTap; // حدث الضغط للتنقل

  const CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconLeft,
    required this.iconRight,
    required this.onTap, // إضافة خاصية onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // استدعاء التنقل عند الضغط
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50, // تغيير اللون حسب الرغبة
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              iconLeft,
              size: 30,
              color: Colors.black,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              iconRight,
              size: 30,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
