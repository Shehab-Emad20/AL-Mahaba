import 'package:almahaba/Submit%20a%20quote/file_upload_field.dart';
import 'package:almahaba/Submit%20a%20quote/widgets/custom_driver_name_text_field.dart';
import 'package:almahaba/Submit%20a%20quote/widgets/custom_number_text_field.dart';
import 'package:almahaba/form/widgets/label_with_aterisk.dart';
import 'package:flutter/material.dart';

class CustomBodySubmitQuote extends StatelessWidget {
  const CustomBodySubmitQuote({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.05,
          horizontal: screenSize.width * 0.04,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Wrap form fields in containers with responsive width
              Container(
                width: isTablet
                    ? constraints.maxWidth * 0.7
                    : constraints.maxWidth,
                margin: EdgeInsets.symmetric(
                    horizontal: isTablet ? constraints.maxWidth * 0.15 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelWithAsterisk(text: 'أسم السائق', simble: '*'),
                    const CustomDriverTextField(
                      hintText: 'اسم السائق',
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    const LabelWithAsterisk(text: 'رقم السائق', simble: '*'),
                    const CustomNumberTextField(
                      hintText: 'ادخل رقم السائق',
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    const LabelWithAsterisk(text: 'أسم السياره', simble: '*'),
                    const CustomDriverTextField(
                      hintText: 'أكتب أسم السيارة',
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    const LabelWithAsterisk(text: 'الموديل', simble: '*'),
                    const CustomDriverTextField(
                      hintText: 'أكتب أسم الموديل',
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    const LabelWithAsterisk(text: ' الصوره', simble: '*'),
                    const FileUploadField(),
                    SizedBox(height: screenSize.height * 0.02),
                    const LabelWithAsterisk(text: 'السعر', simble: '*'),
                    const CustomNumberTextField(
                      hintText: "السعر",
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
