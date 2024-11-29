import 'package:flutter/material.dart';

class TimeTextField extends StatefulWidget {
  const TimeTextField({super.key});

  @override
  _TimeTextFieldState createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  final TextEditingController _controller =
      TextEditingController(); // إنشاء ال Controller

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _controller, // تعيين ال Controller
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'وقت',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
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
              _controller.text =
                  pickedTime.format(context); // صيغة الوقت (HH:MM AM/PM)
            });
          }
        },
      ),
    );
  }
}
