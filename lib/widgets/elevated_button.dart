import 'package:almahaba/widgets/custom_Icons.dart';
import 'package:almahaba/widgets/custom_button.dart';
import 'package:almahaba/widgets/divider_thinkness.dart';
import 'package:flutter/material.dart';

class ElevateTextdButton extends StatelessWidget {
  const ElevateTextdButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min, // لضبط حجم العمود وفقًا لمحتوياته
      children: [
        CustomButton(),
        SizedBox(height: 20), // إضافة مسافة بين الزر والجملة
        DividerThinkness(),
        SizedBox(height: 20),
        CustomIcons()
      ],
    );
  }
}
