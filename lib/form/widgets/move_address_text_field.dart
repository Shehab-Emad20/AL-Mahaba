import 'package:flutter/material.dart';

class MoveAddressTextField extends StatefulWidget {
  final String? initialAddress; // خاصية لتمرير العنوان الأولي
  final ValueChanged<String>? onChanged; // خاصية لتمرير التغيير
  final String hintText; // خاصية النص الإرشادي

  const MoveAddressTextField({
    super.key,
    this.initialAddress,
    this.onChanged,
    required this.hintText , // النص الإرشادي الافتراضي
  });

  @override
  _MoveAddressTextFieldState createState() => _MoveAddressTextFieldState();
}

class _MoveAddressTextFieldState extends State<MoveAddressTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // تهيئة الـ Controller بالنص المبدئي إذا كان موجودًا
    _controller = TextEditingController(text: widget.initialAddress ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 310,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: widget.hintText, // النص الإرشادي المتغير
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 12), // المحاذاة الرأسية
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
