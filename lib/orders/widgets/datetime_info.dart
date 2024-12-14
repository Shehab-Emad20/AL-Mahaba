import 'package:flutter/material.dart';

class DateTimeInfo extends StatelessWidget {
  final double maxWidth;
  final String date;
  final String time;

  const DateTimeInfo({
    super.key,
    required this.maxWidth,
    this.date = 'غير محدد',
    this.time = 'غير محدد',
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: maxWidth > 600 ? 14 : 12,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.calendar_today, color: Colors.grey),
            const SizedBox(width: 8),
            Text(date, style: textStyle),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.access_time, color: Colors.grey),
            const SizedBox(width: 8),
            Text(time, style: textStyle),
          ],
        ),
      ],
    );
  }
}
