import 'package:flutter/material.dart';

class CarSelection extends StatefulWidget {
  final Function(String) onCarSelected; // تعريف onCarSelected كدالة تستقبل قيمة من نوع String

  const CarSelection({super.key, required this.onCarSelected});

  @override
  _CarSelectionState createState() => _CarSelectionState();
}

class _CarSelectionState extends State<CarSelection> {
  String? selectedCar; // السيارة المحددة تبدأ بدون اختيار افتراضي

  final List<Map<String, String>> cars = [
    // "سيدان" العنصر الأول
    {'name': 'ميكروباص', 'image': 'assets/images/hiace-bus-white.jpg'},
    {'name': '7 راكب', 'image': 'assets/images/seven.jpg'},
    {'name': 'سيدان', 'image': 'assets/images/sedan.jpg'},
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
                selectedCar = car['name'];
              });
              widget.onCarSelected(car['name']!); // استدعاء onCarSelected وتمرير السيارة المحددة
            },
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedCar == car['name'] ? Colors.red : Colors.grey,
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
                    width: 80, // حجم الصورة
                    height: 80, // حجم الصورة
                    fit: BoxFit.contain, // لعرض الصورة بالكامل
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
