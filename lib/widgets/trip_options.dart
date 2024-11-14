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
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // توزيع المسافات بالتساوي
      children: options.map((String option) {
        return Flexible(
          fit: FlexFit.tight, // السماح بتوزيع المساحة المتاحة لكل خيار
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Text(option),
            ],
          ),
        );
      }).toList(),
    );
  }
}
