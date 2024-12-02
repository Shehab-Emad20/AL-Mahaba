import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText; // خاصية لتمرير النص المتغير
  final String initialValue; // خاصية لتمرير النص الأولي
  final TextEditingController? controller; // خاصية للتحكم في محتوى الحقل
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.initialValue = '',
    this.controller,
    this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    // استخدام الـ Controller الممرر أو إنشاء واحد جديد
    _internalController = widget.controller ?? TextEditingController(text: widget.initialValue);
    // إضافة مستمع للتغييرات إذا تم تمرير onChanged
    _internalController.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_internalController.text);
      }
    });
  }

  @override
  void dispose() {
    // التخلص من الـ Controller إذا تم إنشاؤه داخليًا
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.8, // استخدام عرض ديناميكي
      height: screenSize.height * 0.06, // ارتفاع ديناميكي
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _internalController, // استخدام الـ Controller هنا
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: widget.hintText, // استخدام النص المتغير هنا
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
