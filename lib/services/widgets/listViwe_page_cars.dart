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
    return Positioned(
      top: 320, // المسافة لتجنب التداخل مع الصورة والنص
      left: 0,
      right: 0,
      bottom: 0, // يسمح بتعبئة المساحة المتبقية
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomContainer(
                title: item['title'],
                subtitle: item['subtitle'],
                iconLeft: item['iconLeft'],
                iconRight: item['iconRight'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CarDetailsScreen(), // الصفحة الوجهة
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
