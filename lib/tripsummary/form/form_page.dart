import 'package:almahaba/tripsummary/form/car_selection.dart';
import 'package:almahaba/tripsummary/form/custom_button2.dart';
import 'package:almahaba/tripsummary/form/custom_buttton_sumaary.dart';
import 'package:almahaba/tripsummary/form/custom_text.dart';
import 'package:almahaba/tripsummary/form/custom_text_field.dart';
import 'package:almahaba/tripsummary/form/date_text_field.dart';
import 'package:almahaba/tripsummary/form/governorate_drop_down.dart';
import 'package:almahaba/tripsummary/form/label_with_aterisk.dart';
import 'package:almahaba/tripsummary/form/notes_text_field.dart';
import 'package:almahaba/tripsummary/form/time_text_field.dart';
import 'package:almahaba/tripsummary/form/trip_options.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 26.0,
            right: 16.0,
          ),
          child: Column(
            children: [
              LabelWithAsterisk(text: 'من', simble: '*'),
              SizedBox(height: 8),
              GovernorateDropdown(),
              SizedBox(height: 8),
              CustomTextField(
                hintText: "أكتب عنوان التحرك",
              ),
              SizedBox(height: 8),
              const LabelWithAsterisk(text: 'الى', simble: '*'),
              SizedBox(height: 8),
              const GovernorateDropdown(),
              SizedBox(height: 8),
              CustomTextField(
                hintText: "أكتب عنوان الوصول",
              ),
              SizedBox(height: 8),
              const DateTextField(),
              SizedBox(height: 8),
              const TimeTextField(),
              SizedBox(height: 8),
              NotesTextField(),
              SizedBox(height: 8),
              TripOptions(),
              CarSelection(),
              CustomButtontrip(),
              CustomText(),
              CustomButttonSumaary()
            ],
          ),
        ),
      ),
    );
  }
}
