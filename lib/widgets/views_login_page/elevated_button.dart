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
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(textbutton: 'تسجيل دخول'),
        SizedBox(height: 20),
        DividerThinkness(text: 'تسجيل دخول عبر'),
        SizedBox(height: 20),
        CustomIcons(),
        SizedBox(height: 20),
        CutomeText(),
      ],
    );
  }
}
