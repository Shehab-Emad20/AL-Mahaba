import 'package:almahaba/Submit%20a%20quote/file_upload_field.dart';
import 'package:almahaba/Submit%20a%20quote/widgets/custom_driver_name_text_field.dart';
import 'package:almahaba/Submit%20a%20quote/widgets/custom_number_text_field.dart';
import 'package:almahaba/form/widgets/label_with_aterisk.dart';
import 'package:flutter/material.dart';

class CustomBodySubmitQuote extends StatelessWidget {
  const CustomBodySubmitQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white, // يمكن تغيير اللون حسب الحاجة
        borderRadius:
            BorderRadius.circular(10.0), // لإضافة حواف دائرية إذا رغبت
      ),
      child: const Column(
        children: [
          LabelWithAsterisk(text: 'أسم السائق', simble: '*'),
          CustomDriverTextField(
            hintText: 'اسم السائق',
          ),
          LabelWithAsterisk(text: 'رقم السائق', simble: '*'),
          CustomNumberTextField(
            hintText: 'ادخل رقم السائق',
          ),
          LabelWithAsterisk(text: 'أسم السياره', simble: '*'),
          CustomDriverTextField(
            hintText: 'أكتب أسم السيارة',
          ),
          LabelWithAsterisk(text: 'الموديل', simble: '*'),
          CustomDriverTextField(
            hintText: 'أكتب أسم الموديل',
          ),
          LabelWithAsterisk(text: ' الصوره', simble: '*'),
          FileUploadField(),
          LabelWithAsterisk(text: 'السعر', simble: '*'),
          CustomNumberTextField(
            hintText: "السعر",
          ),
          
        ],
      ),
    );
  }
}
