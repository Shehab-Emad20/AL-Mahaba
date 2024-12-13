import 'package:flutter/material.dart';
import 'package:almahaba/form/widgets/dropdown_container.dart';

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

  @override
  void initState() {
    super.initState();
    // تأكد من أن القيم تم تمريرها بشكل صحيح
    selectedRegion = widget.selectedRegion;
    selectedGovernorate = widget.selectedGovernorate ?? widget.selectedRegion;
  }

  /// قائمة المحافظات والمناطق المرتبطة بها
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        // القائمة المنسدلة للمحافظة
        DropdownContainer(
          items: governorates.keys.toList(), // أسماء المحافظات
          hintText: 'اختر المحافظة', // النص الإرشادي
          selectedValue: selectedRegion ?? '', // إذا كانت null يعرض نص فارغ
          onChanged: (String? newValue) {
            setState(() {
              selectedRegion = newValue; // تحديث المحافظة المختارة
              selectedGovernorate = newValue; // تعيين نفس القيمة للمنطقة
            });

            if (newValue != null && governorates.containsKey(newValue)) {
              widget.onChangeRegion?.call(newValue);
              widget.onChangeGovernorate
                  ?.call(null); // تعيين null للمنطقة لتحديثها
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
            items: governorates[
                selectedRegion]!, // الأماكن التابعة للمحافظة المحددة
            hintText: 'اختر المكان',
            selectedValue: selectedGovernorate ?? '', // قيمة المنطقة المختارة
            onChanged: (String? newValue) {
              if (newValue != null &&
                  governorates[selectedRegion]!.contains(newValue)) {
                setState(() {
                  selectedGovernorate = newValue; // تحديث المنطقة المختارة
                });
                widget.onChangeGovernorate
                    ?.call(newValue); // استدعاء دالة التغيير
              }
            },
          ),
      ],
    );
  }
}
