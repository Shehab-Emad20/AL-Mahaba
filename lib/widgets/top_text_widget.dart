import 'package:flutter/material.dart';

class TopTextWidget extends StatelessWidget {
  const TopTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: AlignmentDirectional.topCenter,
      child: Text(
        'رحلاتك مع المحبة: أمان أكثر وتزفير أكبر',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
