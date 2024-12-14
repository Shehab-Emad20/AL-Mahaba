import 'package:flutter/material.dart';

class DropdownContainer extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  const DropdownContainer({
    required this.items,
    required this.hintText,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  // Responsive sizing method
  double _getResponsiveSize(BuildContext context, {
    required double desktop,
    required double tablet,
    required double mobile,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 900) return desktop;
    if (screenWidth > 600) return tablet;
    return mobile;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    // Responsive width calculation
    final containerWidth = _getResponsiveSize(
      context,
      desktop: 600.0,
      tablet: screenSize.width * 0.8,
      mobile: screenSize.width * 0.9,
    );

    // Responsive height calculation
    final containerHeight = _getResponsiveSize(
      context,
      desktop: 50.0,
      tablet: 45.0,
      mobile: 40.0,
    );

    // Responsive font size
    final fontSize = _getResponsiveSize(
      context,
      desktop: 16.0,
      tablet: 14.0,
      mobile: 12.0,
    );

    // تأكد من أن القيمة المحددة موجودة في القائمة
    final effectiveValue =
        (selectedValue?.isEmpty ?? true) || !items.contains(selectedValue)
            ? null
            : selectedValue;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), // Increased border radius
            border: Border.all(color: Colors.grey.shade300, width: 1.5), // Softer border
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: effectiveValue,
                isExpanded: true,
                alignment: AlignmentDirectional.centerEnd,
                hint: Text(
                  hintText,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_drop_down, 
                  color: Colors.grey.shade700,
                  size: fontSize + 4,
                ),
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize,
                ),
                dropdownColor: Colors.white, // Dropdown menu background
                menuMaxHeight: 300,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        value,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        );
      },
    );
  }
}
