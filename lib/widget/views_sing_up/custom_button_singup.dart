import 'package:almahaba/widgets/login_form.dart';
import 'package:flutter/material.dart';

class Custombuttonsingup extends StatelessWidget {
  const Custombuttonsingup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'لديك حساب بالفعل؟',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            // هنا يمكنك توجيه المستخدم إلى صفحة إنشاء الحساب
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const LoginForm()),
            );
          },
          child: const Text(
            "قم بستجيل دخول",
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
