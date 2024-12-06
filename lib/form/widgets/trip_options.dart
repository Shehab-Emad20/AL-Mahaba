import 'package:almahaba/form/widgets/date_text_field.dart';
import 'package:almahaba/form/widgets/time_text_field.dart';
import 'package:flutter/material.dart';

class TripOptions extends StatefulWidget {
  final ValueChanged<String?>? onChanged;

  const TripOptions({
    super.key,
    this.onChanged,
  });

  @override
  _TripOptionsState createState() => _TripOptionsState();
}

class _TripOptionsState extends State<TripOptions> {
  String? _selectedOption;

  final List<Map<String, String>> options = [
    {'value': 'go', 'label': 'ذهاب فقط'},
    {'value': 'goandretunatday', 'label': 'ذهاب وعودة في نفس اليوم'},
    {'value': 'goandreturn', 'label': 'ذهاب وعودة في يوم آخر'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // خيارات الرحلة
        ...options.map((Map<String, String> option) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(option['label']!),
                Radio<String>(
                  value: option['value']!,
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(value);
                    }
                  },
                ),
              ],
            ),
          );
        }),

        // إظهار الحقول إذا تم اختيار "ذهاب وعودة في يوم آخر"
        if (_selectedOption == 'goandreturn') ...[
          const SizedBox(height: 8),
          const Center(
            child: DateTextField(
              onChanged: null,
            ), // حقل التاريخ في المركز
          ),
          const SizedBox(height: 8),
          const Center(
            child: TimeTextField(), // حقل الوقت في المركز
          ),
        ],
      ],
    );
  }
}
