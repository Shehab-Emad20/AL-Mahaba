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
    final containerWidth = isDesktop ? 600.0 : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);

    return Container(
      height: 50,
      width: containerWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'وقت',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.access_time,
            color: Colors.grey,
            size: 20,
          ),
        ),
        onTap: () async {
          FocusScope.of(context)
              .requestFocus(FocusNode()); // إخفاء لوحة المفاتيح
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (pickedTime != null) {
            // تحديث النص في الحقل بالوقت المحدد
            setState(() {
              final time =
                  pickedTime.format(context); // صيغة الوقت (HH:MM AM/PM)
              _controller.text = time;
              if (widget.onChanged != null) {
                widget.onChanged!(time);
              }
            });
          }
        },
      ),
    );
  }
}
