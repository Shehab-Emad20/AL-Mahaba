import 'package:flutter/material.dart';

class CarSelection extends StatefulWidget {
  final Function(String)
      onCarSelected; // Definition of onCarSelected to receive a String value

  const CarSelection({super.key, required this.onCarSelected});

  @override
  _CarSelectionState createState() => _CarSelectionState();
}

class _CarSelectionState extends State<CarSelection> {
  String? selectedCar; // The selected car starts without a default choice

  final List<Map<String, String>> cars = [
    {
      'name': 'ميكروباص',
      'value': 'sedan',
      'image': 'assets/images/hiace-bus-white.jpg'
    },
    {'name': '7 راكب', 'value': 'car7', 'image': 'assets/images/seven.jpg'},
    {'name': 'سيدان', 'value': 'bus', 'image': 'assets/images/sedan.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: cars.map((car) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCar =
                    car['value']; // Change to 'value' for consistent selection
              });
              widget.onCarSelected(car['value']!); // Pass the value, not name
            },
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedCar == car['value'] ? Colors.red : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    car['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    car['name']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
