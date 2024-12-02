import 'package:flutter/material.dart';

class TimeTextField extends StatefulWidget {
  final String? initialTime;
  final ValueChanged<String>? onChanged; // خاصية لتمرير الوقت الأولي

  const TimeTextField({super.key, this.initialTime, this.onChanged});

  @override
  _TimeTextFieldState createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // تهيئة ال Controller بالنص المبدئي إذا كان موجودًا
    _controller = TextEditingController(text: widget.initialTime ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _controller,
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
              final time = pickedTime.format(context); // صيغة الوقت (HH:MM AM/PM)
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

