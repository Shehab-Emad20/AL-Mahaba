// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MoveAddressTextField extends StatefulWidget {
  final String? initialAddress;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final IconData? prefixIcon;
  final bool isRequired;
  final bool showLocationIcon;

  const MoveAddressTextField({
    Key? key,
    this.initialAddress,
    this.onChanged,
    required this.hintText,
    this.prefixIcon,
    this.isRequired = false,
    this.showLocationIcon = true,
  }) : super(key: key);

  @override
  _MoveAddressTextFieldState createState() => _MoveAddressTextFieldState();
}

class _MoveAddressTextFieldState extends State<MoveAddressTextField> {
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialAddress ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ResponsiveConfig _calculateResponsiveConfig(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;

    bool isTablet = (screenWidth > 600 && screenWidth <= 1200) ||
        (orientation == Orientation.landscape && screenWidth > 900);

    return ResponsiveConfig(
      containerWidth: isTablet ? screenWidth * 0.8 : screenWidth * 0.95,
      fieldHeight: isTablet ? 60.0 : 50.0,
      fontSize: isTablet ? 16.0 : 14.0,
      horizontalPadding: isTablet ? 20.0 : 15.0,
      iconSize: isTablet ? 24.0 : 20.0,
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
        height: config.fieldHeight,
        decoration: BoxDecoration(
          border: Border.all(
            color: _isFocused ? Colors.red.shade300 : Colors.grey.shade300,
            width: _isFocused ? 2.0 : 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: config.fontSize,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText:
                widget.isRequired ? '${widget.hintText} *' : widget.hintText,
            hintStyle: TextStyle(
              color: _isFocused ? Colors.red.shade300 : Colors.grey.shade600,
              fontWeight: FontWeight.w600,
              fontSize: config.fontSize,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: config.horizontalPadding,
              vertical: 12,
            ),
            border: InputBorder.none,
            prefixIcon: widget.showLocationIcon
                ? Icon(
                    Icons.location_on_outlined,
                    color:
                        _isFocused ? Colors.red.shade400 : Colors.grey.shade600,
                    size: config.iconSize,
                  )
                : widget.prefixIcon != null
                    ? Icon(
                        widget.prefixIcon,
                        color: _isFocused
                            ? Colors.red.shade400
                            : Colors.grey.shade600,
                        size: config.iconSize,
                      )
                    : null,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: _isFocused
                          ? Colors.red.shade400
                          : Colors.grey.shade600,
                      size: config.iconSize,
                    ),
                    onPressed: () {
                      _controller.clear();
                      widget.onChanged?.call('');
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
  final double iconSize;

  ResponsiveConfig({
    required this.containerWidth,
    required this.fieldHeight,
    required this.fontSize,
    required this.horizontalPadding,
    required this.iconSize,
  });
}
