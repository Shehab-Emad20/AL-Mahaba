import 'package:flutter/material.dart';

class TextOrders extends StatelessWidget {
  const TextOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      // Align column content to the right
      children: [
        Text(
          'الردود',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right, // Align text to the right
        ),
        SizedBox(height: 8),
        Text(
          'استعراض جميع الردود المتعلقة بالطلب.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.right, // Align text to the right
        ),
      ],
    );
  }
}
