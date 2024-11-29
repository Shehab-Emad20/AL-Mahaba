import 'package:almahaba/tripsummary/form/custom_buttton_sumaary.dart';
import 'package:almahaba/tripsummary/form/custom_text_field.dart';
import 'package:almahaba/tripsummary/form/label_with_aterisk.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class PageDataForm extends StatelessWidget {
  const PageDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LabelWithAsterisk(text: 'الأسم', simble: '*'),
          CustomTextField(
            hintText: "أكنب أسمك",
          ),
          SizedBox(height: 24),
          LabelWithAsterisk(text: 'العمر', simble: '*'),
          SizedBox(height: 24),
          CustomTextField(
            hintText: "أكتب عمرك",
          ),
          SizedBox(height: 24),
          LabelWithAsterisk(text: 'رقم الهاتف', simble: '*'),
          SizedBox(height: 24),
          CustomTextField(hintText: "أكتب رقم هاتفك"),
          SizedBox(height: 24),
          LabelWithAsterisk(text: 'رقم الواتساب', simble: '*'),
          SizedBox(height: 24),
          CustomTextField(hintText: "أكتب رقم الواتساب"),
          SizedBox(height: 24),
          CustomButttonSumaary()
        ],
      ),
    );
  }
}
