import 'package:flutter/material.dart';

class NotesTextField extends StatelessWidget {
  final String? initialNotes; // خاصية لتمرير النص الأولي
  final TextEditingController? controller; // خاصية للتحكم في محتوى الحقل
  final void Function(String)? onChanged; // خاصية لمعالجة التغيير في النص

  const NotesTextField({
    super.key,
    this.initialNotes,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310, // ضبط العرض الثابت
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        maxLines: 3, // السماح بثلاثة أسطر
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText:
              'أكتب ملاحظاتك هنا !ذا وجدت(مثال عددالافراد عدد الشنط أماكن التوقف أو التحرك االاضافيه ساعات الانتظار الاضافية)',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 8, vertical: 8), // تعديل المسافات لتصغير الحجم
          border: InputBorder.none,
        ),
        onChanged: onChanged, // استدعاء التغيير عند تعديل النص
      ),
    );
  }
}
