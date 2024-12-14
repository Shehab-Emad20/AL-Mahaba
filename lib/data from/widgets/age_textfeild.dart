import 'package:flutter/material.dart';

class AgeTextfeild extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const AgeTextfeild({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<AgeTextfeild> createState() => _AgeTextfeildState();
}

class _AgeTextfeildState extends State<AgeTextfeild> {
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
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontSize: textFontSize,
            height: 1.2,
          ),
          decoration: InputDecoration(
            hintText: _isTextFieldFocused ? '' : 'العمر',
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
