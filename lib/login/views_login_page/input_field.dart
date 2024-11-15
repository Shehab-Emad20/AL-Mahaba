import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const InputField({
    super.key,
    required this.hintText,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01), // تباعد عمودي
      child: TextFormField(
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: screenSize.width * 0.045), // حجم خط ديناميكي
        keyboardType: keyboardType,
        obscureText: isPassword, // لإخفاء النص في حالة كلمة المرور
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: screenSize.width * 0.045,
            color: kPrimaryColor.withOpacity(0.8), // ضبط الشفافية
          ),
          prefixIcon: Icon(icon, color: kPrimaryColor),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15), // زيادة padding
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // جعل الحدود أكثر سلاسة
            borderSide: const BorderSide(
                color: kPrimaryColor, width: 1.5), // عرض الحدود
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // جعل الحدود أكثر سلاسة عند التركيز
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
