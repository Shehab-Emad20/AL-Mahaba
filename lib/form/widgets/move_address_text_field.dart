// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MoveAddressTextField extends StatefulWidget {
  final String? initialAddress; // خاصية لتمرير العنوان الأولي
  final ValueChanged<String>? onChanged; // خاصية لتمرير التغيير
  final String hintText; // خاصية النص الإرشادي

  const MoveAddressTextField({
    Key? key,
    this.initialAddress,
    this.onChanged,
    required this.hintText,
  }) : super(key: key);

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

    // حساب الأحجام المتجاوبة
    final containerWidth = isDesktop
        ? 600.0
        : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);
    final fieldHeight = isDesktop ? 60.0 : (isTablet ? 50.0 : 45.0);
    final fontSize = isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);
    final horizontalPadding = isDesktop ? 20.0 : (isTablet ? 16.0 : 12.0);

    return Container(
      height: fieldHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          hintText: widget.hintText, // النص الإرشادي المتغير
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 12,
          ),
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
