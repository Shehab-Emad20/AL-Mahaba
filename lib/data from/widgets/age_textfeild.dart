import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgeTextfeild extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool isRequired;

  const AgeTextfeild({
    super.key,
    required this.controller,
    required this.onChanged,
    this.isRequired = false,
  });

  @override
  State<AgeTextfeild> createState() => _AgeTextfeildState();
}

class _AgeTextfeildState extends State<AgeTextfeild> {
  bool _isTextFieldFocused = false;

  double _getResponsiveWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? screenWidth * 0.8 : screenWidth * 0.9;
  }

  double _getResponsiveHeight(BuildContext context) {
    return MediaQuery.of(context).size.width > 600 ? 60.0 : 55.0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _getResponsiveHeight(context),
        width: _getResponsiveWidth(context),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isTextFieldFocused 
              ? Colors.red.shade300 
              : Colors.grey.shade400,
            width: _isTextFieldFocused ? 2.0 : 1.5,
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
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3), // Limit to 3 digits
            ],
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
              height: 1.2,
            ),
            decoration: InputDecoration(
              hintText: widget.isRequired 
                ? 'العمر *' 
                : 'العمر',
              hintStyle: TextStyle(
                color: _isTextFieldFocused 
                  ? Colors.red.shade300 
                  : Colors.grey.shade600,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: _isTextFieldFocused 
                        ? Colors.red.shade400 
                        : Colors.grey.shade600,
                    ),
                    onPressed: () {
                      widget.controller.clear();
                      widget.onChanged('');
                    },
                  )
                : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {});
              widget.onChanged(value);
            },
          ),
        ),
      ),
    );
  }
}
