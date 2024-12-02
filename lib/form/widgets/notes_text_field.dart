import 'package:flutter/material.dart';

class NotesTextField extends StatelessWidget {
  final String? initialNotes; // خاصية لتمرير النص الأولي
  final TextEditingController? controller; // خاصية للتحكم في محتوى الحقل
  final onChanged;

  const NotesTextField({
    super.key,
    this.initialNotes,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // ضبط العرض الثابت
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller ?? TextEditingController(text: initialNotes),
        maxLines: 3, // تقليل الأسطر لتصغير الارتفاع
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: 'ملاحظات',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 8, vertical: 8), // تعديل المسافات لتصغير الحجم
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
