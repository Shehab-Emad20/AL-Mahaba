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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    final containerWidth = isDesktop ? 600.0 : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);

    return Container(
      height: 50,
      width: containerWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: widget.hintText, // النص الإرشادي المتغير
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
