import 'package:flutter/material.dart';
import 'package:almahaba/data%20from/api_data.dart';
import 'package:almahaba/data%20from/models_data.dart';
import 'package:almahaba/tripsummary/widgets/view.dart';

class UserFormPage extends StatefulWidget {
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
    final age = int.tryParse(_ageController.text.trim());
    final phone = _phoneController.text.trim();
    final whats = _whatsController.text.trim();

    if (name.isEmpty || age == null || phone.isEmpty || whats.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('من فضلك قم بملء جميع الحقول'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final user = User(name: name, age: age, phone: phone, whats: whats);

    try {
      await _apiService.createOrder(user);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال البيانات بنجاح'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomForm(),
        ),
      );

      // تفريغ الحقول بعد الإرسال
      _nameController.clear();
      _ageController.clear();
      _phoneController.clear();
      _whatsController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء الإرسال: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدخال بيانات المستخدم'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'الاسم'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'العمر'),
              keyboardType: TextInputType.number,
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
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('إرسال'),
            ),
          ],
        ),
      ),
    );
  }
}
