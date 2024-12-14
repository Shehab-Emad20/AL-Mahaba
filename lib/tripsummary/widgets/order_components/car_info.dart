import 'package:flutter/material.dart';

class CarInfo extends StatelessWidget {
  final String? carType;
  final String? tripType;

  const CarInfo({
    super.key,
    required this.carType,
    required this.tripType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مطلوب سيارة ${carType ?? 'غير محدد'}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'نوع الرحلة: ${tripType ?? 'غير محدد'}',
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        const Divider(thickness: 1, height: 24),
      ],
    );
  }
}
