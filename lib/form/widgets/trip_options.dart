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

  ResponsiveConfig _calculateResponsiveConfig(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;

    bool isIPhone12 = 
      (screenWidth == 390 && screenHeight == 844) || 
      (screenWidth == 375 && screenHeight == 812);
    
    bool isTablet = 
      (screenWidth > 600 && screenWidth <= 1200) ||
      (orientation == Orientation.landscape && screenWidth > 900);

    if (isIPhone12) {
      return ResponsiveConfig(
        containerWidth: screenWidth * 0.9,
        optionHeight: 50.0,
        fontSize: 14.0,
        iconSize: 20.0,
      );
    }

    if (isTablet) {
      return ResponsiveConfig(
        containerWidth: screenWidth * 0.8,
        optionHeight: 60.0,
        fontSize: 16.0,
        iconSize: 24.0,
      );
    }

    return ResponsiveConfig(
      containerWidth: screenWidth * 0.95,
      optionHeight: 45.0,
      fontSize: 12.0,
      iconSize: 18.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = _calculateResponsiveConfig(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...options.map((Map<String, String> option) {
              return _buildOption(
                option['label']!,
                option['value']!,
                config.optionHeight,
                config.fontSize,
                config.iconSize,
              );
            }).toList(),
          ],
        ),

        // إظهار الحقول إذا تم اختيار "ذهاب وعودة في يوم آخر"
        if (_selectedOption == 'goandreturn') ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: DateTextField(
              onChanged: null,
            ), // حقل التاريخ في المركز
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: _selectedOption == value ? Colors.red : Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              _selectedOption == value
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: _selectedOption == value ? Colors.red : Colors.grey,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}

// Responsive Configuration Class
class ResponsiveConfig {
  final double containerWidth;
  final double optionHeight;
  final double fontSize;
  final double iconSize;

  ResponsiveConfig({
    required this.containerWidth,
    required this.optionHeight,
    required this.fontSize,
    required this.iconSize,
  });
}
