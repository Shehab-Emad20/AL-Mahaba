import 'package:flutter/material.dart';

class TripOptions extends StatefulWidget {
  const TripOptions({super.key});

  @override
  _TripOptionsState createState() => _TripOptionsState();
}

class _TripOptionsState extends State<TripOptions> {
  String? _selectedOption; // المتغير لتخزين الخيار المحدد

  // قائمة الخيارات
  final List<String> options = [
    'ذهاب فقط',
    'ذهاب وعودة في نفس اليوم',
    'ذهاب وعودة في يوم آخر',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // محاذاة العمود إلى اليمين
      children: options.map((String option) {
        return Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // محاذاة العناصر داخل الصف إلى اليمين
          children: [
            Radio<String>(
              value: option,
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            const SizedBox(width: 8), // مسافة بين الراديو والنص
            Text(option),
          ],
        );
      }).toList(),
    );
  }
}
