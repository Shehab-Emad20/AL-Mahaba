import 'package:flutter/material.dart';

class ElevateTextdButton extends StatelessWidget {
  const ElevateTextdButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // لضبط حجم العمود وفقًا لمحتوياته
      children: [
        ElevatedButton(
          onPressed: () {
            // هنا يمكنك إضافة وظيفة تسجيل الدخول
            // مثل التحقق من صحة المدخلات والانتقال إلى الصفحة التالية
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFd0352c), // لون الخلفية للزر
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
        ),
        const SizedBox(height: 20), // إضافة مسافة بين الزر والجملة
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(thickness: 1, color: Colors.grey), // خط أفقي
            ),
            SizedBox(width: 8), // إضافة مسافة بين الخط والجملة
            Text(
              'تسجيل دخول عبر',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(width: 6), // إضافة مسافة بين الجملة والخط
            Expanded(
              child: Divider(thickness: 1, color: Colors.grey), // خط أفقي
            ),
          ],
        ),
      ],
    );
  }
}
