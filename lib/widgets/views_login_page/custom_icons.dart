import 'package:almahaba/widgets/views_login_page/social_button%20.dart';
import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
            icon: Icons.g_mobiledata,
            label: 'Google',
            color: Colors.red,
            onPressed: () {}),
        const SizedBox(width: 10),
        SocialButton(
            icon: Icons.facebook,
            label: 'Facebook',
            color: Colors.blue,
            onPressed: () {}),
        const SizedBox(width: 10),
        SocialButton(
            icon: Icons.apple,
            label: 'Apple',
            color: Colors.black,
            onPressed: () {}),
      ],
    );
  }
}
