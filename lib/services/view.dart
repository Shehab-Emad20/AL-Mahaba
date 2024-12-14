import 'package:almahaba/services/widgets/listViwe_page_cars.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/services/widgets/custom_image.dart';
import 'package:almahaba/services/widgets/custom_text_srvices.dart';

class ViewBodyServices extends StatelessWidget {
  const ViewBodyServices({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'سيارات سيدان',
        'subtitle': 'المجموعات الصغيرة أو الأفرادالين يحتاجون وسيلة نقل مريحة وشخصية',
        'iconLeft': Icons.arrow_back_ios,
        'iconRight': Icons.directions_car,
      },
      {
        'title': 'مركبات هايس(14 راكب)',
        'subtitle': 'لخدمة المجموعات الكبيرة والمتوسطة الحجم مثل الأسر أ, الأصدقاء الذين يسافرون معاً',
        'iconLeft': Icons.arrow_back_ios,
        'iconRight': Icons.directions_bus,
      },
      {
        'title': 'سوبر جيت(50 راكب)',
        'subtitle': 'لرحلات التي تضم مجموعات كبيرة جداً حيث توفر هذه تامركبا سعة أكثر وراحة أكبر للركاب',
        'iconLeft': Icons.arrow_back_ios,
        'iconRight': Icons.electric_car,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10), 
              const CustomTextServices(),
              const SizedBox(height: 10), 
              const CustomImage(),
              const SizedBox(height: 10), 
              ListViwePageCars(items: items),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
