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
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    final containerWidth = isDesktop ? 600.0 : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);
    final fontSize = isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0);

    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        maxLines: 3, // السماح بثلاثة أسطر
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          hintText:
              'أكتب ملاحظاتك هنا !ذا وجدت(مثال عددالافراد عدد الشنط أماكن التوقف أو التحرك االاضافيه ساعات الانتظار الاضافية)',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: fontSize,
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // تعديل المسافات لتصغير الحجم
          border: InputBorder.none,
        ),
        onChanged: onChanged, // استدعاء التغيير عند تعديل النص
      ),
    );
  }
}
