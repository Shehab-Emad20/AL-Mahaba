import 'package:almahaba/widgets/views_login_page/custom_button.dart';
import 'package:almahaba/widgets/views_login_page/custom_icons.dart';
import 'package:almahaba/widgets/views_login_page/cutome_text.dart';
import 'package:almahaba/widgets/views_login_page/divider_thinkness.dart';
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
        CustomIcons(),
        SizedBox(height: 20),
        CutomeText()
      ],
    );
  }
}
