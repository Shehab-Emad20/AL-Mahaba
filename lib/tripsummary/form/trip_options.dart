import 'package:almahaba/tripsummary/form/date_text_field.dart';
import 'package:almahaba/tripsummary/form/time_text_field.dart';
import 'package:flutter/material.dart';

class TripOptions extends StatefulWidget {
  const TripOptions({super.key});

  @override
  _TripOptionsState createState() => _TripOptionsState();
}

class _TripOptionsState extends State<TripOptions> {
  String? _selectedOption;

  final List<String> options = [
    'ذهاب فقط',
    'ذهاب وعودة في نفس اليوم',
    'ذهاب وعودة في يوم آخر',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // خيارات الرحلة
        ...options.map((String option) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(option),
                Radio<String>(
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),

        // إظهار الحقول إذا تم اختيار "ذهاب وعودة في يوم آخر"
        if (_selectedOption == 'ذهاب وعودة في يوم آخر') ...[
          const SizedBox(height: 8),
          Center(
            child: const DateTextField(), // حقل التاريخ في المركز
          ),
          const SizedBox(height: 8),
          Center(
            child: TimeTextField(), // حقل الوقت في المركز
          ),
        ],
      ],
    );
  }
}
