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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          hintText,
          textAlign: TextAlign.right,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        value: selectedValue,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        underline: Container(),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                textDirection: TextDirection.rtl,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
