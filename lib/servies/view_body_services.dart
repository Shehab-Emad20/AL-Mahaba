import 'package:flutter/material.dart';
import 'package:almahaba/servies/custom_container_car.dart';
import 'package:almahaba/servies/custom_image.dart';
import 'package:almahaba/servies/custom_text_srvices.dart';

class ViewBodyServices extends StatelessWidget {
  const ViewBodyServices({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات العناصر في القائمة
    final List<Map<String, dynamic>> items = [
      {
        'title': 'سيارات سيدان',
        'subtitle':
            ' المجموعات الصغيرة أو الأفرادالين يحتاجون وسيلة نقل مريحة وشخصية ',
        'iconLeft': Icons.arrow_back_ios,
        'iconRight': Icons.directions_car,
      },
      {
        'title': 'مركبات هايس(14 راكب)',
        'subtitle':
            'لخدمة المجموعات الكبيرة والمتوسطة الحجم مثل الأسر أ, الأصدقاء الذين يسافرون معاً',
        'iconLeft': Icons.arrow_back_ios,
        'iconRight': Icons.directions_bus,
      },
      {
        'title': 'سوبر جيت(50 راكب)',
        'subtitle':
            'لرحلات التي تضم مجموعات كبيرة جداً حيث توفر هذه تامركبا سعة أكثر وراحة أكبر للركاب',
        'iconLeft': Icons.arrow_back_ios,
        'iconRight': Icons.electric_car,
      },
    ];

    return Stack(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextServices(), // النص أولاً
          ],
        ),
        const Positioned(
          top: 50, // إزاحة الصورة لأسفل بمقدار 50
          right: 0,
          left: 0,
          child: CustomImage(), // الصورة
        ),
        // قائمة العناصر في الـ ListView.builder أسفل الصورة
        Positioned(
          top: 300, // المسافة لتجنب التداخل مع الصورة والنص
          left: 0,
          right: 0,
          bottom: 0, // يسمح بتعبئة المساحة المتبقية
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: items.length, // عدد العناصر في القائمة
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomContainer(
                    title: item['title'],
                    subtitle: item['subtitle'],
                    iconLeft: item['iconLeft'],
                    iconRight: item['iconRight'],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
