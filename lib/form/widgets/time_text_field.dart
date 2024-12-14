import 'package:flutter/material.dart';

class TimeTextField extends StatefulWidget {
  final String? initialTime;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  const TimeTextField({
    Key? key,
    this.initialTime,
    this.onChanged,
    this.hintText = 'وقت',
  }) : super(key: key);

  @override
  _TimeTextFieldState createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialTime ?? '');
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

    bool isIPhone12 = 
      (screenWidth == 390 && screenHeight == 844) || 
      (screenWidth == 375 && screenHeight == 812);
    
    bool isTablet = 
      (screenWidth > 600 && screenWidth <= 1200) ||
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

  Future<void> _selectTime(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode()); // Dismiss keyboard
    
    final config = _calculateResponsiveConfig(context);
    final ThemeData themeData = Theme.of(context);
    
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red.shade300,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            timePickerTheme: TimePickerThemeData(
              dayPeriodTextStyle: TextStyle(
                fontSize: config.fontSize,
                color: Colors.black87,
              ),
              hourMinuteTextStyle: TextStyle(
                fontSize: config.fontSize * 1.5,
                color: Colors.black87,
              ),
              dialHandColor: Colors.red.shade300,
              dialBackgroundColor: Colors.red.shade50,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final time = pickedTime.format(context);
      setState(() {
        _controller.text = time;
        widget.onChanged?.call(time);
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
        onTap: () => _selectTime(context),
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
            enabled: false,
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
                Icons.access_time,
                color: _isFocused ? Colors.red : Colors.grey,
                size: config.iconSize,
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: _isFocused ? Colors.red : Colors.grey,
                        size: config.iconSize,
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
