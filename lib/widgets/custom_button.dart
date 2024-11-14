import 'package:almahaba/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String textbutton;

  const CustomButton2({
    super.key,
    required this.textbutton,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02,
            horizontal: screenSize.width * 0.04,
          ),
          decoration: BoxDecoration(
            color: Colors.red, // لون الخلفية الحمراء
            borderRadius:
                BorderRadius.circular(10), // حواف دائرية بمقدار 10 بكسل
          ),
          child: Text(
            textbutton,
            style: TextStyle(
              color: kwhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: screenSize.width * 0.045,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
