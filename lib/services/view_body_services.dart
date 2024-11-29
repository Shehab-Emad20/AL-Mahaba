import 'package:almahaba/services/listViwe_page_cars.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/services/custom_image.dart';
import 'package:almahaba/services/custom_text_srvices.dart';

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

    return Scaffold(
      body: Stack(
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
          ListViwePageCars(items: items),
        ],
      ),
    );
  }
}
