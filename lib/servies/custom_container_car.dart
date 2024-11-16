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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50, // تغيير اللون حسب الرغبة
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
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
    );
  }
}
