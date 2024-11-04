import 'package:almahaba/widgets/dropdown_container.dart';
import 'package:almahaba/widgets/location_row.dart';
import 'package:flutter/material.dart';

class GovernorateDropdown extends StatefulWidget {
  const GovernorateDropdown({super.key});

  @override
  _GovernorateDropdownState createState() => _GovernorateDropdownState();
}

class _GovernorateDropdownState extends State<GovernorateDropdown> {
  String? selectedGovernorate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownContainer(
          items: const [
            'القاهرة',
            'الجيزة',
            'الأسكندرية',
            'الدقهلية',
            'البحر الأحمر',
            'البحيرة',
            'الفيوم',
            'الغربية',
            'الإسماعيلية',
            'المنوفية',
            'المنيا',
            'القليوبية',
            'الوادي الجديد',
            'السويس',
            'اسوان',
            'اسيوط',
            'بني سويف',
            'بورسعيد',
            'دمياط',
            'الشرقية',
            'جنوب سيناء',
            'كفر الشيخ',
            'مطروح',
            'الأقصر',
            'قنا',
            'شمال سيناء',
            'سوهاج'
          ],
          hintText: 'اختر المحافظة',
          selectedValue: selectedGovernorate,
          onChanged: (String? newValue) {
            setState(() {
              selectedGovernorate = newValue;
            });
          },
        ),
        const SizedBox(height: 20),
        LocationRow(),
      ],
    );
  }
}
