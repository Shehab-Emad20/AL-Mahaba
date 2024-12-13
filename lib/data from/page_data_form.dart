import 'package:almahaba/data%20from/widgets/age_textfeild.dart';
import 'package:almahaba/data%20from/widgets/nema_textfeild.dart';
import 'package:almahaba/data%20from/widgets/phone_text_feild.dart';
import 'package:almahaba/data%20from/widgets/whats_app_text_feild.dart';
import 'package:almahaba/form/widgets/custom_buttton_sumaary.dart';
import 'package:almahaba/form/widgets/label_with_aterisk.dart';
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
              const LabelWithAsterisk(text: 'الاسم', simble: '*'),
              const SizedBox(height: 8),
              NemaTextfeild(
                controller: _nameController,
                labelText: 'أكتب أسمك',
                onChanged: (value) {
                  // Handle change
                },
              ),
              const SizedBox(height: 16),
              const LabelWithAsterisk(text: 'العمر', simble: '*'),
              const SizedBox(height: 16),
              AgeTextfeild(
                controller: _ageController,
                onChanged: (value) {
                  // Handle change
                },
              ),
              const SizedBox(height: 16),
              const LabelWithAsterisk(text: 'رقم الهاتف', simble: '*'),
              const SizedBox(height: 16),
              PhoneTextfeild(
                controller: _whatsController,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              const LabelWithAsterisk(text: 'رقم الواتس', simble: '*'),
              const SizedBox(height: 16),
              WhatsAppTextfeild(
                controller: _whatsController,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              CustomButttonSumaary(
                onPressed: () {
                  _submitForm(context);
                },
                buttonText: 'أرسال',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
