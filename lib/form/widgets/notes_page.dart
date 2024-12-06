import 'package:almahaba/form/widgets/label_with_aterisk.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 

            TextField(
              maxLines: null, // يسمح بإدخال ملاحظات متعددة الأسطر
              decoration: InputDecoration(
                hintText: 'اكتب ملاحظاتك هنا...',
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(10),
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            );
  }
}
