import 'package:almahaba/form/models_oreder.dart';
import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {
  final Location? from;
  final Location? to;

  const LocationInfo({
    super.key,
    required this.from,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'من: ${from?.governorate ?? 'غير محدد'} (${from?.region ?? 'غير محدد'})',
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          'إلى: ${to?.governorate ?? 'غير محدد'} (${to?.region ?? 'غير محدد'})',
          style: const TextStyle(fontSize: 14),
        ),
        const Divider(thickness: 1, height: 24),
      ],
    );
  }
}
