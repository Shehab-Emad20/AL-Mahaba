import 'package:flutter/material.dart';

class FixedDropdown extends StatelessWidget {
  const FixedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 160,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: const Text(
          'مطار القاهرة',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
        underline: Container(),
        onChanged: null, // عدم السماح بالتعديل
        items: const [
          DropdownMenuItem(
            value: 'مطار القاهرة',
            child: Text(
              'مطار القاهرة',
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
