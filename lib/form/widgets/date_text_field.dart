import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  final DateTime? initialDate; // تاريخ أولي كـ DateTime
  final ValueChanged<DateTime>? onChanged; // دالة التغيير كـ DateTime

  const DateTextField({super.key, this.initialDate, this.onChanged});

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // تهيئة النص بالتاريخ الأولي بصيغة YYYY-MM-DD إذا كان موجودًا
    _controller = TextEditingController(
      text: widget.initialDate != null
          ? widget.initialDate!.toIso8601String().split('T')[0]
          : '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.06,
      width: screenSize.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.right,
        readOnly: true, // جعل الحقل للقراءة فقط
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
            initialDate: widget.initialDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            setState(() {
              _controller.text = pickedDate.toIso8601String().split('T')[0];
              if (widget.onChanged != null) {
                widget.onChanged!(pickedDate);
              }
            });
          }
        },
      ),
    );
  }
}
