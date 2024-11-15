import 'package:almahaba/widgets/custom_button.dart';
import 'package:almahaba/widgets/custom_button2.dart';
import 'package:almahaba/widgets/custom_text.dart';
import 'package:almahaba/widgets/date_text_field.dart';
import 'package:almahaba/widgets/governorate_drop_down.dart';
import 'package:almahaba/widgets/label_with_aterisk.dart';
import 'package:almahaba/widgets/notes_text_field.dart';
import 'package:almahaba/widgets/red_banner_widget.dart';
import 'package:almahaba/widgets/time_text_field.dart';
import 'package:almahaba/widgets/top_text_widget.dart';
import 'package:almahaba/widgets/trip_options.dart';
import 'package:flutter/material.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      // Add scrolling support
      child: Column(
        children: [
          SizedBox(
              height: screenSize.height *
                  0.05), // Adjust height relative to screen size
          const TopTextWidget(),
          SizedBox(height: screenSize.height * 0.01),
          const RedBannerWidget(),
          SizedBox(height: screenSize.height * 0.01),
          const LabelWithAsterisk(text: 'من', simble: '*'),
          SizedBox(height: screenSize.height * 0.01),
          const GovernorateDropdown(),
          SizedBox(height: screenSize.height * 0.01),
          const LabelWithAsterisk(text: 'الى', simble: '*'),
          SizedBox(height: screenSize.height * 0.01),
          const GovernorateDropdown(),
          SizedBox(height: screenSize.height * 0.01),
          const DateTextField(),
          SizedBox(height: screenSize.height * 0.01),
          const TimeTextField(),
          SizedBox(height: screenSize.height * 0.01),
          const NotesTextField(),
          const TripOptions(),
          const CustomButton2(
            textbutton:
                'سيتواصل معك خدمة العملاء في أقرب وقت لتحديد التكلفة بعد ارسال طلب الرحله',
          ),
          const CustomText(),
          const CustomButtontrip(
            textbutton: ' إرسال طلب الرحله',
          )
        ],
      ),
    );
  }
}
