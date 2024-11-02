import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CutomeText extends StatelessWidget {
  const CutomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'إنشاء حساب',
          style: TextStyle(
              fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            // هنا يمكنك توجيه المستخدم إلى صفحة إنشاء الحساب
            // على سبيل المثال: Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: const Text(
            'ليس لديك حساب ',
            style: TextStyle(
              fontSize: 16,
              color: kBlackColor,
            ),
          ),
        ),
      ],
    );
  }
}
