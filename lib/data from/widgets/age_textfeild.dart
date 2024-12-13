import 'package:flutter/material.dart';

class AgeTextfeild extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const AgeTextfeild({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 310,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.number, // Allow only numeric input for age
        decoration: const InputDecoration(
          labelText: 'العمر', // Label text for "age"
          labelStyle: TextStyle(color: Colors.grey), // Optional style for label
          contentPadding: EdgeInsets.symmetric(
              horizontal: 10, vertical: 12), // Vertical padding
          border: InputBorder.none,
        ),
        onChanged: onChanged, // Call the passed onChanged function
      ),
    );
  }
}
