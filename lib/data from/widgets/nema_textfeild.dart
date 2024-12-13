import 'package:flutter/material.dart';

class NemaTextfeild extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String) onChanged;

  const NemaTextfeild({
    super.key,
    required this.controller,
    required this.labelText,
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
        decoration: InputDecoration(
          labelText: labelText, // Set the label text as provided
          labelStyle: const TextStyle(color: Colors.grey), // Optional style for label
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 12), // Vertical padding
          border: InputBorder.none,
        ),
        onChanged: onChanged, // Call the passed onChanged function
      ),
    );
  }
}
