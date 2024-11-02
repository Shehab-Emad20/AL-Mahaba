import 'package:almahaba/almahaba_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Almahaba());
}

class Almahaba extends StatelessWidget {
  const Almahaba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: AlmahabaHome());
  }
}
