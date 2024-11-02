import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // هنا يمكنك إضافة وظيفة تسجيل الدخول
        // مثل التحقق من صحة المدخلات والانتقال إلى الصفحة التالية
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFd0352c), // لون الخلفية للزر
        padding: const EdgeInsets.symmetric(
          horizontal: 120, // زيادة عرض المساحة حول النص
          vertical: 10, // زيادة ارتفاع المساحة حول النص
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // زيادة انحناء الزوايا
        ),
      ),
      child: const Text(
        'تسجيل الدخول',
        style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold), // زيادة حجم النص
      ),
    );
  }
}
