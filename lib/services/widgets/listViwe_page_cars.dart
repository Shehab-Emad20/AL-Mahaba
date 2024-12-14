import 'package:almahaba/services/Page_images/body_images.dart';
import 'package:almahaba/services/widgets/custom_container_car.dart';
import 'package:flutter/material.dart';

class ListViwePageCars extends StatelessWidget {
  const ListViwePageCars({
    super.key,
    required this.items,
  });

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomContainer(
            title: item['title'],
            subtitle: item['subtitle'],
            iconLeft: item['iconLeft'],
            iconRight: item['iconRight'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CarDetailsScreen(),
                ),
              );
            },
          ),
        )).toList(),
      ),
    );
  }
}
