import 'package:flutter/material.dart';

class NotesTextField extends StatefulWidget {
  final String? initialNotes;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;

  const NotesTextField({
    super.key,
    this.initialNotes,
    this.controller,
    this.onChanged,
    this.hintText = 'أكتب ملاحظاتك هنا !ذا وجدت(مثال عددالافراد عدد الشنط أماكن التوقف أو التحرك الاضافيه ساعات الانتظار الاضافية)',
  });

  @override
  _NotesTextFieldState createState() => _NotesTextFieldState();
}

class _NotesTextFieldState extends State<NotesTextField> {
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialNotes ?? '');
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  ResponsiveConfig _calculateResponsiveConfig(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;

    bool isIPhone12 = 
      (screenWidth == 390 && screenHeight == 844) || 
      (screenWidth == 375 && screenHeight == 812);
    
    bool isTablet = 
      (screenWidth > 600 && screenWidth <= 1200) ||
      (orientation == Orientation.landscape && screenWidth > 900);

    if (isIPhone12) {
      return ResponsiveConfig(
        containerWidth: screenWidth * 0.9,
        fieldHeight: 120.0,
        fontSize: 14.0,
        horizontalPadding: 15.0,
        verticalPadding: 12.0,
        maxLines: 3,
      );
    }

    if (isTablet) {
      return ResponsiveConfig(
        containerWidth: screenWidth * 0.8,
        fieldHeight: 150.0,
        fontSize: 16.0,
        horizontalPadding: 20.0,
        verticalPadding: 15.0,
        maxLines: 4,
      );
    }

    return ResponsiveConfig(
      containerWidth: screenWidth * 0.95,
      fieldHeight: 100.0,
      fontSize: 12.0,
      horizontalPadding: 12.0,
      verticalPadding: 10.0,
      maxLines: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = _calculateResponsiveConfig(context);

    return Focus(
      onFocusChange: (focused) {
        setState(() {
          _isFocused = focused;
        });
      },
      child: Container(
        width: config.containerWidth,
        decoration: BoxDecoration(
          border: Border.all(
            color: _isFocused ? Colors.red.shade300 : Colors.grey.shade300,
            width: _isFocused ? 2.0 : 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          maxLines: config.maxLines,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: config.fontSize,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: _isFocused ? Colors.red.shade300 : Colors.grey,
              fontSize: config.fontSize,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: config.horizontalPadding,
              vertical: config.verticalPadding,
            ),
            border: InputBorder.none,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: _isFocused ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        widget.onChanged?.call('');
                      });
                    },
                  )
                : null,
          ),
          onChanged: (value) {
            setState(() {});
            widget.onChanged?.call(value);
          },
        ),
      ),
    );
  }
}

// Responsive Configuration Class
class ResponsiveConfig {
  final double containerWidth;
  final double fieldHeight;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final int maxLines;

  ResponsiveConfig({
    required this.containerWidth,
    required this.fieldHeight,
    required this.fontSize,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.maxLines,
  });
}
