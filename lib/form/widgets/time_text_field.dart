import 'package:flutter/material.dart';

class TimeTextField extends StatefulWidget {
  final String? initialTime;
  final ValueChanged<String>? onChanged;

  const TimeTextField({
    Key? key,
    this.initialTime,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TimeTextField> createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  late TextEditingController _controller;

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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    
    // حساب الأحجام المتجاوبة
    final containerWidth = isDesktop ? 600.0 : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);
    final fieldHeight = isDesktop ? 60.0 : (isTablet ? 50.0 : 45.0);
    final fontSize = isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);
    final iconSize = isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0);
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
          hintText: 'وقت',
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
          prefixIcon: Icon(
            Icons.access_time,
            color: Colors.grey,
            size: iconSize,
          ),
        ),
        readOnly: true,
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  timePickerTheme: TimePickerThemeData(
                    dayPeriodTextStyle: TextStyle(fontSize: fontSize),
                    hourMinuteTextStyle: TextStyle(fontSize: fontSize * 1.5),
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
        },
      ),
    );
  }
}
