import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {
  final double maxWidth;
  final String fromLocation;
  final String fromDetails;
  final String toLocation;
  final String toDetails;

  const LocationInfo({
    super.key,
    required this.maxWidth,
    this.fromLocation = 'غير محدد',
    this.fromDetails = 'غير محدد',
    this.toLocation = 'غير محدد',
    this.toDetails = 'غير محدد',
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: maxWidth > 600 ? 14 : 12,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'من: $fromLocation ($fromDetails)',
          style: textStyle,
        ),
        const SizedBox(height: 8),
        Text(
          'إلى: $toLocation ($toDetails)',
          style: textStyle,
        ),
        const Divider(thickness: 1, height: 24),
      ],
    );
  }
}
