import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({super.key});

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  final TextEditingController _controller =
      TextEditingController(); // إنشاء ال Controller

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _controller, // تعيين ال Controller
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'تاريخ',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
        ),
        onTap: () async {
          FocusScope.of(context)
              .requestFocus(FocusNode()); // إخفاء لوحة المفاتيح
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            // تحديث النص في الحقل بالتاريخ المحدد
            setState(() {
              _controller.text = "${pickedDate.toLocal()}"
                  .split(' ')[0]; // صيغة التاريخ (YYYY-MM-DD)
            });
          }
        },
      ),
    );
  }
}
