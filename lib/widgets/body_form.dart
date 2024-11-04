import 'package:almahaba/widgets/governorate_drop_down.dart';
import 'package:almahaba/widgets/label_with_aterisk.dart';
import 'package:almahaba/widgets/red_banner_widget.dart';
import 'package:almahaba/widgets/top_text_widget.dart';
import 'package:flutter/material.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 50),
        TopTextWidget(),
        SizedBox(height: 20),
        RedBannerWidget(),
        SizedBox(height: 20),
        LabelWithAsterisk(),
        SizedBox(height: 10),
        GovernorateDropdown(),
      ],
    );
  }
}
