import 'package:flutter/material.dart';
import 'package:almahaba/form/widgets/dropdown_container.dart';

class GovernorateDropdown extends StatefulWidget {
  final String? selectedGovernorate;
  final String? selectedRegion;
  final ValueChanged<String?>? onChangeRegion;
  final ValueChanged<String?>? onChangeGovernorate;

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
  String? selectedRegion;
  String? selectedGovernorate;

  final Map<String, List<String>> governorates = {
    "القاهرة": [
      "القاهرة",
      "مطار القاهرة",
      "المعادي",
      "مدينة نصر",
      "حلوان",
      "ميدان التحرير",
      "جاردن سيتي",
      "المقطم",
      "الزمالك",
      "شبرا",
      "الرحاب",
      "التجمع الخامس",
      "العباسية",
      "الزهراء",
      "حدائق القبة"
    ],
    "الجيزة": [
      "الجيزة",
      "الهرم",
      "المهندسين",
      "الدقي",
      "6 أكتوبر",
      "الشيخ زايد",
      "ميدان الجيزة",
      "فيصل",
      "المطريه",
      "الصف",
      "البدرشين",
      "كرداسة"
    ],
    "الإسكندرية": [
      "الإسكندرية",
      "محطة الرمل",
      "سيدي جابر",
      "بحري",
      "المنتزه",
      "سان ستيفانو",
      "سموحة",
      "جليم",
      "عابدين",
      "برج العرب",
      "منتزه العصافرة",
      "الإبراهيمية"
    ],
    "الإسماعيلية": [
      "الإسماعيلية",
      "القنطرة شرق",
      "القنطرة غرب",
      "حي الشيخ زايد",
      "الفردان",
      "التل الكبير",
      "فايد",
      "المحسمة"
    ],
    "السويس": [
      "السويس",
      "حي الأربعين",
      "عتاقة",
      "حي السويس",
      "بور توفيق",
      "الربيع",
      "العين السخنة"
    ],
    "بورسعيد": [
      "بورسعيد",
      "الزهور",
      "بورفؤاد",
      "العرب",
      "المناخ",
      "الضواحي",
      "شرق بورسعيد",
      "الجنابي",
      "الجزيرة"
    ],
    "الأقصر": [
      "الأقصر",
      "الكرنك",
      "وادي الملوك",
      "البر الغربي",
      "إسنا",
      "الأقصر الجديدة",
      "الطود",
      "البياضية",
      "الزينية"
    ],
    "أسوان": [
      "أسوان",
      "السد العالي",
      "جزيرة فيلة",
      "النوبة",
      "كوم أمبو",
      "إدفو",
      "أسوان الجديدة",
      "الشلال",
      "جبل الطير"
    ],
    "المنيا": [
      "المنيا",
      "ملوي",
      "دير مواس",
      "العدوة",
      "مطاي",
      "بني مزار",
      "المنيا الجديدة",
      "مغاغة",
      "سمالوط"
    ],
    "سوهاج": [
      "سوهاج",
      "جرجا",
      "أخميم",
      "المراغة",
      "طهطا",
      "مدينة سوهاج",
      "ساقلته",
      "البلينا"
    ],
    "قنا": [
      "قنا",
      "قوص",
      "نجع حمادي",
      "أبوتشت",
      "دشنا",
      "فرشوط",
      "قفط",
      "قنا الجديدة"
    ],
    "بني سويف": [
      "بني سويف",
      "الواسطي",
      "ناصر",
      "ببا",
      "سمسطا",
      "إهناسيا",
      "الفشن",
      "بني سويف الجديدة"
    ],
    "الفيوم": [
      "الفيوم",
      "بحيرة قارون",
      "الفيوم الجديدة",
      "سنورس",
      "إطسا",
      "طامية",
      "الفيوم القديمة"
    ],
    "دمياط": [
      "دمياط",
      "رأس البر",
      "فارسكور",
      "كفر سعد",
      "الزرقا",
      "دمياط الجديدة",
      "شطا",
      "الجميل"
    ],
    "الدقهلية": [
      "الدقهلية",
      "المنصورة",
      "ميت غمر",
      "طلخا",
      "أجا",
      "بلقاس",
      "الجمالية",
      "نبروه",
      "شربين",
      "الدقهلية الجديدة"
    ],
    "الغربية": [
      "الغربية",
      "طنطا",
      "المحلة الكبرى",
      "زفتى",
      "قطور",
      "كفر الزيات",
      "السنطة",
      "سمنود",
      "الزواية"
    ],
    "كفر الشيخ": [
      "كفر الشيخ",
      "دسوق",
      "فوه",
      "بيلا",
      "بلطيم",
      "قلين",
      "البرلس",
      "سيدي سالم"
    ],
    "البحيرة": [
      "البحيرة",
      "دمنهور",
      "كوم حمادة",
      "إدكو",
      "رشيد",
      "إيتاي البارود",
      "النوبارية",
      "حوش عيسى",
      "الرحمانية"
    ],
    "مطروح": [
      "مطروح",
      "مرسى مطروح",
      "الحمام",
      "العلمين",
      "الضبعة",
      "سيوة",
      "براني",
      "السلوم"
    ],
    "شمال سيناء": [
      "شمال سيناء",
      "العريش",
      "رفح",
      "الشيخ زويد",
      "بئر العبد",
      "القصيمة",
      "الطور"
    ],
    "جنوب سيناء": [
      "جنوب سيناء",
      "شرم الشيخ",
      "دهب",
      "سانت كاترين",
      "نويبع",
      "الطور",
      "طابا",
      "الرأس محمد"
    ],
    "البحر الأحمر": [
      "البحر الأحمر",
      "الغردقة",
      "سفاجا",
      "مرسى علم",
      "القصير",
      "الزعفرانة",
      "الطريق الدولي"
    ],
    "الوادي الجديد": [
      "الوادي الجديد",
      "الخارجة",
      "الداخلة",
      "باريس",
      "الفرافرة",
      "البداري",
      "عنيبة"
    ],
  };

  @override
  void initState() {
    super.initState();
    selectedRegion = widget.selectedRegion;
    selectedGovernorate = widget.selectedGovernorate;
  }

  @override
  void didUpdateWidget(GovernorateDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedRegion != selectedRegion) {
      setState(() {
        selectedRegion = widget.selectedRegion;
      });
    }
    if (widget.selectedGovernorate != selectedGovernorate) {
      setState(() {
        selectedGovernorate = widget.selectedGovernorate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownContainer(
          items: governorates.keys.toList(),
          hintText: 'اختر المنطقة',
          selectedValue: selectedRegion ?? '',
          onChanged: (String? newValue) {
            setState(() {
              selectedRegion = newValue;
              selectedGovernorate = null;
            });
            widget.onChangeRegion?.call(newValue);
          },
        ),
        const SizedBox(height: 20), // Increased spacing
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: selectedRegion != null && governorates[selectedRegion] != null
              ? DropdownContainer(
                  key: UniqueKey(), // Add a unique key for animation
                  items: governorates[selectedRegion]!,
                  hintText: 'اختر المحافظة',
                  selectedValue: selectedGovernorate ?? '',
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGovernorate = newValue;
                    });
                    widget.onChangeGovernorate?.call(newValue);
                  },
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}