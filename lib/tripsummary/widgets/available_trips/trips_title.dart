import 'package:flutter/material.dart';

class TripsTitle extends StatelessWidget {
  const TripsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'الرحلات المتاحة',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      textAlign: TextAlign.right,
    );
  }
}
