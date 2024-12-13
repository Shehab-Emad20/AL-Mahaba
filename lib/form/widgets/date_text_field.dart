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
        readOnly: true, // جعل الحقل للقراءة فقط
        decoration: const InputDecoration(
          hintText: 'تاريخ',
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
            Icons.calendar_today, // أيقونة التاريخ
            color: Colors.grey, // اللون الخاص بالأيقونة
            size: 20, // حجم الأيقونة
          ),
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
