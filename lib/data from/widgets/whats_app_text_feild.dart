import 'package:flutter/material.dart';

class WhatsAppTextfeild extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const WhatsAppTextfeild({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<WhatsAppTextfeild> createState() => _WhatsAppTextfeildState();
}

class _WhatsAppTextfeildState extends State<WhatsAppTextfeild> {
  bool _isTextFieldFocused = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // تحسين الأحجام لتكون أكثر تناسقاً
    final containerWidth = screenWidth * 0.9;  // زيادة العرض قليلاً
    final containerHeight = 55.0;  // ارتفاع ثابت للحفاظ على التناسق
    final labelFontSize = 14.0;    // حجم ثابت للـ label
    final textFontSize = 16.0;     // حجم ثابت للنص المدخل
    
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
          textAlign: TextAlign.right,  // تغيير محاذاة النص إلى اليمين
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.phone,
          style: TextStyle(
            fontSize: textFontSize,
            height: 1.2,  // تحسين ارتفاع النص
          ),
          decoration: InputDecoration(
            hintText: _isTextFieldFocused ? '' : 'رقم الواتس',
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
