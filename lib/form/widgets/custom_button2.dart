import 'package:flutter/material.dart';

class CustomButtontrip extends StatelessWidget {
  const CustomButtontrip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Background color
            padding:
                EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
          ),
          onPressed: () {
            // Add your action here
          },
          child: Text(
            'ستتواصل معك خدمة العملاء في أقرب وقت لتحديد التكلفة بعد ارسال طلب الرحلة',
            textAlign: TextAlign.center, // Moved textAlign here
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 14, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Text weight
            ),
          ),
        ),
      ),
    );
  }
}
