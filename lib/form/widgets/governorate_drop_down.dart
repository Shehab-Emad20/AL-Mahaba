import 'package:flutter/material.dart';
import 'package:almahaba/form/widgets/dropdown_container.dart';

/// ويدجت لتحديد المحافظة والمنطقة من قوائم منسدلة
class GovernorateDropdown extends StatefulWidget {
  final String? selectedGovernorate; // المحافظة المحددة حاليًا
  final String? selectedRegion; // المنطقة المحددة حاليًا
  final ValueChanged<String?>? onChangeRegion; // دالة لاستدعاء تغيير المنطقة
  final ValueChanged<String?>?
      onChangeGovernorate; // دالة لاستدعاء تغيير المحافظة

  const GovernorateDropdown({
    super.key,
    this.selectedGovernorate,
    this.selectedRegion,
    this.onChangeRegion,
    this.onChangeGovernorate,
  });

  @override
  _GovernorateDropdownState createState() => _GovernorateDropdownState();
}

class _GovernorateDropdownState extends State<GovernorateDropdown> {
  String? selectedRegion; // المنطقة التي تم اختيارها حاليًا
  String? selectedGovernorate; // المحافظة التي تم اختيارها حاليًا

  /// تهيئة القيم عند إنشاء الويدجت
  @override
  void initState() {
    super.initState();
    selectedRegion = widget.selectedRegion;
    selectedGovernorate = widget.selectedGovernorate;
  }

  /// قائمة المحافظات والمناطق المرتبطة بها
  final Map<String, List<String>> governorates = {
    'القاهرة': [
      "القاهرة",
      "مطار القاهرة",
      "المعادي",
      "مدينة نصر",
      "حلوان",
      // مناطق أخرى ...
    ],
    'الجيزة': [
      "الجيزة",
      "الهرم",
      "المهندسين",
      // مناطق أخرى ...
    ],
    // محافظات أخرى...
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // القائمة المنسدلة للمحافظة
        DropdownContainer(
          items: governorates.keys.toList(), // أسماء المحافظات
          hintText: 'اختر المحافظة', // النص الإرشادي
          selectedValue: selectedRegion ??
              '', // القيمة المختارة حاليًا، وإذا كانت null تعرض نصًا فارغًا
          onChanged: (String? newValue) {
            setState(() {
              selectedRegion = newValue; // تحديث المحافظة المختارة
              selectedGovernorate = newValue; // إعادة تعيين المنطقة
              print('@@@@@@@@@@2  ${newValue}      ${selectedRegion}');
            });

            if (newValue != null && governorates.containsKey(newValue)) {
              widget.onChangeRegion?.call(newValue);
              widget.onChangeGovernorate?.call(null);
            } else {
              widget.onChangeRegion?.call(null);
              widget.onChangeGovernorate?.call(null);
            }
          },
        ),
        SizedBox(height: 8), // مسافة بين العناصر
        // القائمة المنسدلة للمنطقة
        if (selectedRegion != null && governorates[selectedRegion] != null)
          DropdownContainer(
            items: governorates[selectedRegion]!,
            hintText: 'اختر المكان',
            selectedValue: selectedGovernorate ?? '',
            onChanged: (String? newValue) {
              if (newValue != null &&
                  governorates[selectedRegion]!.contains(newValue)) {
                setState(() {
                  selectedGovernorate = newValue; // تحديث المنطقة المختارة
                });
                widget.onChangeGovernorate?.call(newValue);
              }
            },
          ),
      ],
    );
  }
}
