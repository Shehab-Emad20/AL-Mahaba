import 'package:almahaba/form/api_orders.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/form/widgets/car_selection.dart';
import 'package:almahaba/form/widgets/custom_buttton_sumaary.dart';
import 'package:almahaba/form/widgets/date_text_field.dart';
import 'package:almahaba/form/widgets/governorate_drop_down.dart';
import 'package:almahaba/form/widgets/label_with_aterisk.dart';
import 'package:almahaba/form/widgets/notes_text_field.dart';
import 'package:almahaba/form/widgets/time_text_field.dart';
import 'package:almahaba/form/widgets/trip_options.dart';
import 'package:almahaba/data%20from/page_data_form.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _fromGovernorate = '';
  String _toGovernorate = '';
  String _fromRegion = '';
  String _toRegion = '';
  String _car = '';
  DateTime? _selectedDate;
  String? _selectedTime;

  String? returnTime;
  String? returnDate;
  String? _notes;
  String? _tripType;
  TextEditingController _notesController = TextEditingController();
  Future<void> _createOrder() async {
    if (_fromRegion.isEmpty ||
        _toRegion.isEmpty ||
        _car.isEmpty ||
        _selectedDate == null ||
        _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك قم بملء جميع البيانات'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Map<String, dynamic> orderDetails = {};
    if (_tripType == 'goandreturn') {
      orderDetails = {
        'from': {
          'governorate': _fromGovernorate,
          'region': _fromRegion,
          "explain": "dfdsf"
        },
        'to': {
          'governorate': _toGovernorate,
          'region': _toRegion,
          "explain": "dsfdsf"
        },
        'date': _selectedDate!.toIso8601String(),
        'time': _selectedTime,
        'notes': _notes ?? '',
        'type': _tripType,
        "returntime": returnTime,
        "returnDate": returnDate,
        'car': _car
      };
    } else {
      orderDetails = {
        "from": {
          "governorate": "القاهرة",
          "region": "مطار القاهرة",
          "explain": "dfdsf"
        },
        "to": {
          "governorate": "المنيا",
          "region": "المنيا",
          "explain": "dsfdsf"
        },
        "date": "2024-11-30",
        "time": "12:08 PM",
        "notes": "dffdsfd",
        "type": "goandreturn",
        "returntime": "12:08 PM",
        "returnDate": "2024-11-30",
        "car": "sedan"
      };
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserFormPage(orderDetails: orderDetails)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Column(
              children: [
                const LabelWithAsterisk(text: 'من', simble: '*'),
                GovernorateDropdown(
                  selectedGovernorate: _fromGovernorate,
                  selectedRegion: _fromRegion,
                  onChangeRegion: (region) {
                    setState(() => _fromRegion = region ?? '');
                  },
                  onChangeGovernorate: (governorate) {
                    setState(() => _fromGovernorate = governorate ?? '');
                  },
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(text: 'إلى', simble: '*'),
                GovernorateDropdown(
                  selectedGovernorate: _toGovernorate,
                  selectedRegion: _toRegion,
                  onChangeRegion: (region) {
                    setState(() => _toRegion = region ?? '');
                  },
                  onChangeGovernorate: (governorate) {
                    setState(() => _toGovernorate = governorate ?? '');
                  },
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(text: 'التاريخ', simble: '*'),
                DateTextField(
                  onChanged: (date) => setState(() => _selectedDate = date),
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  text: 'الوقت',
                  simble: '*',
                ),
                TimeTextField(
                  onChanged: (time) => setState(() => _selectedTime = time),
                ),
                const SizedBox(height: 16),
                const LabelWithAsterisk(
                    text: 'ملاحظات',
                    simble: '*'), // Pass the controller to the widget
                NotesTextField(
                  onChanged: (notes) => setState(() => _notes = notes),
                  controller: _notesController,
                ),
                const SizedBox(height: 16),
                TripOptions(onChanged: (option) {
                  setState(() => _tripType = option);
                }),
                CarSelection(
                  onCarSelected: (selectedCar) {
                    setState(() => _car = selectedCar);
                  },
                ),
                CustomButttonSumaary(onPressed: _createOrder),
              ],
            ),
          ),
        ),
      ),
    );
  }
}