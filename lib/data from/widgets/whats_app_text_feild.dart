import 'package:flutter/material.dart';

class WhatsAppTextfeild extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const WhatsAppTextfeild({
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
        keyboardType: TextInputType.phone, // Allow phone number input (WhatsApp)
        decoration: const InputDecoration(
          labelText: 'رقم الواتس', // Label text for "WhatsApp Number"
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
