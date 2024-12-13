import 'package:flutter/material.dart';
import 'package:almahaba/Submit%20a%20quote/file_upload_field.dart';
import 'package:almahaba/Submit%20a%20quote/widgets/custom_driver_name_text_field.dart';
import 'package:almahaba/Submit%20a%20quote/widgets/custom_number_text_field.dart';
import 'package:almahaba/form/widgets/label_with_aterisk.dart';
import 'package:almahaba/utils/responsive_helper.dart';

class CustomBodySubmitQuote extends StatelessWidget {
  const CustomBodySubmitQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: ResponsiveHelper.getPadding(context),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Container(
            width: ResponsiveHelper.getWidth(context),
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveHelper.isMobilePhone(context) ? 30.0 : 60.0,
              horizontal: ResponsiveHelper.isMobilePhone(context) ? 16.0 : 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelWithAsterisk(text: 'أسم السائق', simble: '*'),
                const CustomDriverTextField(
                  hintText: 'اسم السائق',
                ),
                const LabelWithAsterisk(text: 'رقم السائق', simble: '*'),
                const CustomNumberTextField(
                  hintText: 'ادخل رقم السائق',
                ),
                const LabelWithAsterisk(text: 'أسم السياره', simble: '*'),
                const CustomDriverTextField(
                  hintText: 'أكتب أسم السيارة',
                ),
                const LabelWithAsterisk(text: 'الموديل', simble: '*'),
                const CustomDriverTextField(
                  hintText: 'أكتب أسم الموديل',
                ),
                const LabelWithAsterisk(text: ' الصوره', simble: '*'),
                const FileUploadField(),
                const LabelWithAsterisk(text: 'السعر', simble: '*'),
                const CustomNumberTextField(
                  hintText: "السعر",
                ),
                SizedBox(
                    height:
                        ResponsiveHelper.isMobilePhone(context) ? 20.0 : 30.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add submit logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Add red background color
                      foregroundColor: Colors.white, // Add white text color
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.isMobilePhone(context)
                            ? 24.0
                            : 32.0,
                        vertical: ResponsiveHelper.isMobilePhone(context)
                            ? 12.0
                            : 16.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 3, // Add a slight shadow
                    ),
                    child: Text(
                      'تقديم',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getFontSize(context),
                        fontWeight: FontWeight.bold, // Make text bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
