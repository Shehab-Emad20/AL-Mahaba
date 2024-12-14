import 'package:flutter/material.dart';

class TripsSubtitle extends StatelessWidget {
  const TripsSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'يتم إضافة رحلات جديدة باستمرار حسب طلبات العملاء',
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      textAlign: TextAlign.right,
    );
  }
}
