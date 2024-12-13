import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:almahaba/utils/responsive_helper.dart';

class CustomNumberTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomNumberTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.getPadding(context),
      child: Container(
        width: ResponsiveHelper.getWidth(context),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: ResponsiveHelper.getFontSize(context),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.isMobilePhone(context) ? 12.0 : 16.0,
              vertical: ResponsiveHelper.isMobilePhone(context) ? 8.0 : 12.0,
            ),
            border: InputBorder.none,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
