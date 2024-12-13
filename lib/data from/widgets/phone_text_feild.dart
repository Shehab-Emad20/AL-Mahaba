import 'package:flutter/material.dart';

class PhoneTextfeild extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const PhoneTextfeild({
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
        keyboardType: TextInputType.phone, // Allow phone number input
        decoration: const InputDecoration(
          labelText: 'رقم الهاتف', // Label text for "Phone Number"
          labelStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10, vertical: 12),
          border: InputBorder.none,
        ),
        onChanged: onChanged, // Call the passed onChanged function
      ),
    );
  }
}
