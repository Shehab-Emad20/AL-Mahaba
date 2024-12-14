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
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;

    // حساب الأحجام المتجاوبة
    final containerWidth = isDesktop
        ? 600.0
        : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);
    final optionHeight = isDesktop ? 60.0 : (isTablet ? 50.0 : 45.0);
    final fontSize = isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);
    final iconSize = isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: containerWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              ...options.map((Map<String, String> option) {
                return _buildOption(
                  option['label']!,
                  option['value']!,
                  optionHeight,
                  fontSize,
                  iconSize,
                );
              }).toList(),
            ],
          ),
        ),

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

  Widget _buildOption(
    String title,
    String value,
    double height,
    double fontSize,
    double iconSize,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              _selectedOption == value
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: _selectedOption == value ? Colors.red : Colors.grey,
              size: iconSize,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: _selectedOption == value ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
