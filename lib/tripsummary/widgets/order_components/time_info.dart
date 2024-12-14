import 'package:flutter/material.dart';

class TimeInfo extends StatelessWidget {
  final String? date;
  final String? time;

  const TimeInfo({
    super.key,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              date ?? 'غير محدد',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.access_time, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              time ?? 'غير محدد',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
