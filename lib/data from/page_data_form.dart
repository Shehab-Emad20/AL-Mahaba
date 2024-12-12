import 'package:almahaba/tripsummary/view.dart';
import 'package:almahaba/tripsummary/widgets/available_tips_container.dart';
import 'package:almahaba/tripsummary/widgets/custom_form.dart';

import 'package:flutter/material.dart';
import 'package:almahaba/form/api_orders.dart';
import 'package:almahaba/form/models_oreder.dart';

class UserFormPage extends StatelessWidget {
  UserFormPage({super.key, required this.orderDetails});

  final Map<String, dynamic> orderDetails;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _whatsController = TextEditingController();

  final ApiService _apiService = ApiService();

  void _submitForm(BuildContext context) async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final phone = _phoneController.text.trim();
    final whats = _whatsController.text.trim();

    if (name.isEmpty || age.isEmpty || phone.isEmpty || whats.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى ملء جميع الحقول المطلوبة.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final user = User(name: name, phone: phone, whats: whats, age: age);

    var a = orderDetails;
    a.addAll({'user': user.toJson()});

    try {
      await _apiService.createTrip(a);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال الرحلة بنجاح!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => CustomForm()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء إرسال البيانات: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدخال بيانات الرحلة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'الاسم'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'العمر'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'رقم الهاتف'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _whatsController,
                decoration: const InputDecoration(labelText: 'رقم الواتس'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _submitForm(context);
                },
                child: const Text('إرسال'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
