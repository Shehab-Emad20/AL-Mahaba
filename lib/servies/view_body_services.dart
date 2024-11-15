import 'package:almahaba/servies/custom_text_srvices.dart';
import 'package:flutter/material.dart';

class ViewBodyServices extends StatelessWidget {
  const ViewBodyServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextServices(),
      ],
    );
  }
}
