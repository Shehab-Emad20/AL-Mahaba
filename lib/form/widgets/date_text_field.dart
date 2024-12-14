import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextField extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onChanged;
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateTextField({
    Key? key,
    this.initialDate,
    this.onChanged,
    this.hintText = 'تاريخ',
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late TextEditingController _controller;
  DateTime? _selectedDate;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = TextEditingController(
      text: _selectedDate != null
          ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
          : '',
    );
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

    bool isIPhone12 = (screenWidth == 390 && screenHeight == 844) ||
        (screenWidth == 375 && screenHeight == 812);

    bool isTablet = (screenWidth > 600 && screenWidth <= 1200) ||
        (orientation == Orientation.landscape && screenWidth > 900);

    if (isIPhone12) {
      return ResponsiveConfig(
        containerWidth: screenWidth * 0.9,
        fieldHeight: 50.0,
        fontSize: 14.0,
        horizontalPadding: 15.0,
        iconSize: 20.0,
      );
    }

    if (isTablet) {
      return ResponsiveConfig(
        containerWidth: screenWidth * 0.8,
        fieldHeight: 60.0,
        fontSize: 16.0,
        horizontalPadding: 20.0,
        iconSize: 24.0,
      );
    }

    return ResponsiveConfig(
      containerWidth: screenWidth * 0.95,
      fieldHeight: 45.0,
      fontSize: 12.0,
      horizontalPadding: 12.0,
      iconSize: 18.0,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode()); // Dismiss keyboard

    final config = _calculateResponsiveConfig(context);
    final ThemeData themeData = Theme.of(context);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red.shade300,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red.shade300,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        widget.onChanged?.call(pickedDate);
      });
    }
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
      child: InkWell(
        // Changed from GestureDetector to InkWell for better tap feedback
        onTap: () => _selectDate(context), // Explicitly pass context
        borderRadius: BorderRadius.circular(12),
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
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _controller,
            textAlign: TextAlign.right,
            readOnly: true,
            enabled: false, // Disable text field interaction
            style: TextStyle(
              fontSize: config.fontSize,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: _isFocused ? Colors.red.shade300 : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: config.fontSize,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: config.horizontalPadding,
                vertical: 12,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.calendar_today,
                color: _isFocused ? Colors.red : Colors.grey,
                size: config.iconSize,
              ),
              suffixIcon: _selectedDate != null
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: _isFocused ? Colors.red : Colors.grey,
                        size: config.iconSize,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedDate = null;
                          _controller.clear();
                          widget.onChanged?.call(DateTime.now());
                        });
                      },
                    )
                  : null,
            ),
          ),
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
