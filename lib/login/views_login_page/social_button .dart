import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color; // إضافة لون لكل زر
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color, // إضافة اللون كخاصية
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // تنفيذ دالة الضغط عند النقر
      child: Column(
        mainAxisSize: MainAxisSize.min, // اجعل الأبعاد أقل
        children: [
          Icon(icon, size: 40, color: color), // استخدام اللون المحدد للأيقونة
          const SizedBox(height: 5), // مسافة بين الأيقونة والنص
          Text(label,
              style: TextStyle(
                  fontSize: 14, color: color)), // استخدام نفس اللون للنص
        ],
      ),
    );
  }
}
