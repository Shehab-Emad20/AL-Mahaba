import 'package:almahaba/widgets/social_button%20.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({super.key});

  // Future<void> _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   // استخدم canLaunchUrl باختصار
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          icon: Icons.g_mobiledata,
          label: 'Google',
          color: Colors.red,
          onPressed: () {
            // _launchURL('https://accounts.google.com/signin');
          },
        ),
        const SizedBox(width: 10),
        SocialButton(
          icon: Icons.facebook,
          label: 'Facebook',
          color: Colors.blue,
          onPressed: () {
            // _launchURL('https://www.facebook.com/login');
          },
        ),
        const SizedBox(width: 10),
        SocialButton(
          icon: Icons.apple,
          label: 'Apple',
          color: Colors.black,
          onPressed: () {
            // _launchURL('https://appleid.apple.com/auth/signin');
          },
        ),
      ],
    );
  }
}
