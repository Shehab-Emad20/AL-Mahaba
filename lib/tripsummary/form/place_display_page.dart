import 'package:flutter/material.dart';

class PlaceDisplayPage extends StatelessWidget {
  final String place;

  const PlaceDisplayPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المكان المختار')),
      body: Center(
        child: Text(
          'المكان المختار هو: $place',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
