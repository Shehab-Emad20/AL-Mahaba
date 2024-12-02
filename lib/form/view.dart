import 'package:almahaba/data%20from/page_data_form.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/form/widgets/car_selection.dart';
import 'package:almahaba/form/widgets/custom_buttton_sumaary.dart';
import 'package:almahaba/form/widgets/date_text_field.dart';
import 'package:almahaba/form/widgets/governorate_drop_down.dart';
import 'package:almahaba/form/widgets/label_with_aterisk.dart';
import 'package:almahaba/form/widgets/notes_text_field.dart';
import 'package:almahaba/form/widgets/time_text_field.dart';
import 'package:almahaba/form/widgets/trip_options.dart';
import 'package:dio/dio.dart';

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
  bool _isLoading = false;
  String? _errorMessage;
  String _car = '';
  DateTime? _selectedDate;
  String? _selectedTime;
  String? _notes;

  Future<void> _createOrder() async {
    if (_fromRegion.isEmpty ||
        _toRegion.isEmpty ||
        _car.isEmpty ||
        _selectedDate == null ||
        _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'من فضلك قم بملء جميع البيانات',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final orderDetails = {
        'from': {
          'governorate': _fromGovernorate,
          'region': _fromRegion,
          'explain': 'منطقة التحرك',
        },
        'to': {
          'governorate': _toGovernorate,
          'region': _toRegion,
          'explain': 'منطقة الوصول',
        },
        'date': _selectedDate!.toIso8601String(),
        'time': _selectedTime,
        'notes': _notes ?? '',
        'car': _car,
      };

      final response = await Dio().post(
        'http://your-server-url/api/order',
        data: orderDetails,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'تم إرسال البيانات بنجاح!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserFormPage(),
          ),
        );
      } else {
        throw Exception('خطأ في الاستجابة من السيرفر');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء إرسال الطلب: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text(_errorMessage!)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 26.0,
            right: 16.0,
          ),
          child: Column(
            children: [
              const LabelWithAsterisk(text: 'من', simble: '*'),
              const SizedBox(height: 8),
              GovernorateDropdown(
                selectedGovernorate: _fromGovernorate,
                selectedRegion: _fromRegion,
                onChangeRegion: (region) {
                  setState(() {
                    _fromRegion = region ?? '';
                  });
                },
                onChangeGovernorate: (governorate) {
                  setState(() {
                    _fromGovernorate = governorate ?? '';
                  });
                },
              ),
              const SizedBox(height: 8),
              const LabelWithAsterisk(text: 'الى', simble: '*'),
              const SizedBox(height: 8),
              GovernorateDropdown(
                selectedGovernorate: _toGovernorate,
                selectedRegion: _toRegion,
                onChangeRegion: (region) {
                  setState(() {
                    _toRegion = region ?? '';
                  });
                },
                onChangeGovernorate: (governorate) {
                  setState(() {
                    _toGovernorate = governorate ?? '';
                  });
                },
              ),
              const SizedBox(height: 8),
              const LabelWithAsterisk(text: 'التاريخ', simble: '*'),
              const SizedBox(height: 8),
              DateTextField(
                onChanged: (value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              const LabelWithAsterisk(text: 'الوقت', simble: '*'),
              const SizedBox(height: 8),
              TimeTextField(
                onChanged: (value) {
                  setState(() {
                    _selectedTime = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              const LabelWithAsterisk(text: 'الملاحظات ', simble: '*'),
              const SizedBox(height: 8),
              NotesTextField(
                onChanged: (value) {
                  setState(() {
                    _notes = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TripOptions(),
              CarSelection(
                onCarSelected: (selectedCar) {
                  setState(() {
                    _car = selectedCar;
                  });
                },
              ),
              CustomButttonSumaary(
                onPressed: _createOrder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
