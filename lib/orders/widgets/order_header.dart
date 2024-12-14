import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  final double maxWidth;
  final String carType;
  final String tripType;

  const OrderHeader({
    super.key,
    required this.maxWidth,
    this.carType = 'غير محدد',
    this.tripType = 'غير محدد',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'مطلوب سيارة $carType',
          style: TextStyle(
            fontSize: maxWidth > 600 ? 18 : 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'نوع الرحلة: $tripType',
          style: TextStyle(
            fontSize: maxWidth > 600 ? 16 : 14,
            color: Colors.grey[700],
          ),
        ),
        const Divider(thickness: 1, height: 24),
      ],
    );
  }
}
