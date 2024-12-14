import 'package:flutter/material.dart';

class CarSelection extends StatefulWidget {
  final Function(String) onCarSelected;

  const CarSelection({Key? key, required this.onCarSelected}) : super(key: key);

  @override
  State<CarSelection> createState() => _CarSelectionState();
}

class _CarSelectionState extends State<CarSelection> {
  String? selectedCar;

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
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;

    final cardWidth = isDesktop ? 120.0 : (isTablet ? 100.0 : 90.0);
    final cardHeight = isDesktop ? 180.0 : (isTablet ? 150.0 : 130.0);
    final imageSize = isDesktop ? 100.0 : (isTablet ? 80.0 : 70.0);
    final fontSize = isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0);
    final containerWidth = isDesktop
        ? 600.0
        : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);

    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: cars.map((car) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCar = car['value'];
              });
              widget.onCarSelected(car['value']!);
            },
            child: Container(
              width: cardWidth,
              height: cardHeight,
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
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    car['name']!,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
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
