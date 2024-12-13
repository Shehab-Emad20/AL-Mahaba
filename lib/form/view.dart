import 'package:flutter/material.dart';
import 'package:almahaba/form/api_orders.dart';
import 'package:almahaba/form/widgets/car_selection.dart';
import 'package:almahaba/form/widgets/custom_buttton_sumaary.dart';
import 'package:almahaba/form/widgets/date_text_field.dart';
import 'package:almahaba/form/widgets/governorate_drop_down.dart';
import 'package:almahaba/form/widgets/label_with_aterisk.dart';
import 'package:almahaba/form/widgets/move_address_text_field.dart';
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
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    final padding = isDesktop ? 32.0 : (isTablet ? 24.0 : 16.0);
    final maxWidth =
        isDesktop ? 800.0 : (isTablet ? 600.0 : screenSize.width * 0.95);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(text: 'من', simble: '*'),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 8),
                  const MoveAddressTextField(
                    hintText: "أكتب عنوان التحرك",
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(text: 'إلى', simble: '*'),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 8),
                  const MoveAddressTextField(
                    hintText: "أكتب عنوان الوصول",
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(text: 'التاريخ', simble: '*'),
                  const SizedBox(height: 8),
                  DateTextField(
                    onChanged: (date) => setState(() => _selectedDate = date),
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(text: 'الوقت', simble: '*'),
                  const SizedBox(height: 8),
                  TimeTextField(
                    onChanged: (time) => setState(() => _selectedTime = time),
                  ),
                  const SizedBox(height: 16),
                  const LabelWithAsterisk(text: 'ملاحظات', simble: '*'),
                  const SizedBox(height: 8),
                  NotesTextField(
                    onChanged: (notes) => setState(() => _notes = notes),
                    controller: _notesController,
                  ),
                  const SizedBox(height: 16),
                  TripOptions(onChanged: (option) {
                    setState(() => _tripType = option);
                  }),
                  const SizedBox(height: 16),
                  CarSelection(
                    onCarSelected: (selectedCar) {
                      setState(() => _car = selectedCar);
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomButttonSumaary(
                    onPressed: _createOrder,
                    buttonText: 'التالي',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
