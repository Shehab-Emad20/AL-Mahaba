import 'package:flutter/material.dart';

class PlaceDisplayPage extends StatelessWidget {
  final String place;

  const PlaceDisplayPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المكان المختار')),
      body: Center(
        child: Text(
          'المكان المختار هو: $place',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
