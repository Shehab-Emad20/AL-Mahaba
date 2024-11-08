import 'package:almahaba/widgets/custom_text_field.dart';
import 'package:almahaba/widgets/fixed_dropdown.dart';

import 'package:flutter/material.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(),
        SizedBox(width: 10),
        FixedDropdown(),
      ],
    );
  }
}
