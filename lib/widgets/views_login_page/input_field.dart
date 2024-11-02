import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const InputField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320, // Width of the input field
      child: TextField(
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 18,
            color: kPrimaryColor, // Set the color properly here
          ),
          prefixIcon: Icon(icon, color: kPrimaryColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: kPrimaryColor, width: 1), // No need for const here
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Colors.blue,
                width: 2), // Color of the border when focused
          ),
        ),
      ),
    );
  }
}
