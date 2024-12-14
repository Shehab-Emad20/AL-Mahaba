import 'package:flutter/material.dart';

class NemaTextfeild extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String) onChanged;

  const NemaTextfeild({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
  });

  @override
  State<NemaTextfeild> createState() => _NemaTextfeildState();
}

class _NemaTextfeildState extends State<NemaTextfeild> {
  bool _isTextFieldFocused = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // تحسين الأحجام لتكون أكثر تناسقاً
    final containerWidth = screenWidth * 0.9;
    final containerHeight = 55.0;
    final labelFontSize = 14.0;
    final textFontSize = 16.0;
    
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _isTextFieldFocused = hasFocus;
          });
        },
        child: TextField(
          controller: widget.controller,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: textFontSize,
            height: 1.2,
          ),
          decoration: InputDecoration(
            hintText: _isTextFieldFocused ? '' : widget.labelText,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: labelFontSize,
              fontWeight: FontWeight.w500,
            ),
            hintTextDirection: TextDirection.rtl,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: InputBorder.none,
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
