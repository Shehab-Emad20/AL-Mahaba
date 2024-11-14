import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({super.key});

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.06, // Use relative height
      width: screenSize.width * 0.8, // Use relative width
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: 'تاريخ',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
        ),
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            setState(() {
              _controller.text = "${pickedDate.toLocal()}".split(' ')[0];
            });
          }
        },
      ),
    );
  }
}
