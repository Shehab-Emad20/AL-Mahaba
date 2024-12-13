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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    final containerWidth = isDesktop
        ? 600.0
        : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);

    // تأكد من أن القيمة المحددة موجودة في القائمة
    final effectiveValue =
        (selectedValue?.isEmpty ?? true) || !items.contains(selectedValue)
            ? null
            : selectedValue;

    return Container(
      height: 50,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey, width: 2),
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
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            menuMaxHeight: 300,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    value,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
