import 'package:almahaba/tripsummary/view.dart';
import 'package:almahaba/tripsummary/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/form/api_orders.dart';
import 'package:almahaba/form/models_oreder.dart';

class UserFormPage extends StatefulWidget {
  final Map<String, Object?> orderDetails;

  const UserFormPage({super.key, required this.orderDetails});

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _whatsController = TextEditingController();

  final ApiService _apiService = ApiService();

  void _submitForm() async {
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

    final orderDetails = widget.orderDetails;

    final trip = Trip(
      from: Location(
        governorate: (orderDetails['from']
                as Map<String, dynamic>?)?['governorate'] as String? ??
            'Default Governorate',
        region: (orderDetails['from'] as Map<String, dynamic>?)?['region']
                as String? ??
            'Default Region',
        explain: 'From location explanation',
      ),
      to: Location(
        governorate: (orderDetails['to']
                as Map<String, dynamic>?)?['governorate'] as String? ??
            'Default Governorate',
        region: (orderDetails['to'] as Map<String, dynamic>?)?['region']
                as String? ??
            'Default Region',
        explain: 'To location explanation',
      ),
      date: DateTime.tryParse(orderDetails['date'] as String? ?? '') ??
          DateTime.now(),
      time: orderDetails['time'] as String? ?? 'Default Time',
      notes: orderDetails['notes'] as String? ?? 'Default Notes',
      type: orderDetails['type'] as String? ?? 'Default Type',
      car: orderDetails['car'] as String? ?? 'Default Car',
      user: user,
    );

    print(trip.toJson());
    try {
      await _apiService.createTrip(trip, ApiManager.token);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال الرحلة بنجاح!'),
          backgroundColor: Colors.green,
        ),
      );

      // إغلاق الصفحة الحالية بعد الانتقال إلى الصفحة الجديدة
      Navigator.pop(context); // يرجعك للصفحة السابقة
      // أو استخدم Navigator.push إذا كنت تريد الانتقال إلى صفحة جديدة
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomForm(
                    ShowOrder: [],
                  )));

      // إغلاق الصفحة الحالية بعد الانتقال إلى الصفحة الجديدة
      Navigator.pop(context);
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
                onPressed: _submitForm,
                child: const Text('إرسال'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
