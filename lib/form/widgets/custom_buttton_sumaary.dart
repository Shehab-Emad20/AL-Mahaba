import 'package:flutter/material.dart';

// مساعد لحساب الأحجام المتجاوبة للزر
class SummaryButtonSizeHelper {
  final BuildContext context;
  
  SummaryButtonSizeHelper(this.context);
  
  Size get screenSize => MediaQuery.of(context).size;
  double get screenWidth => screenSize.width;
  
  // حساب عرض الزر بناءً على حجم الشاشة
  double get buttonWidth {
    if (screenWidth > 1200) return 700.0;
    if (screenWidth > 900) return 600.0;
    if (screenWidth > 600) return screenWidth * 0.8;
    return screenWidth * 0.9;
  }
  
  // حساب ارتفاع الزر
  double get buttonHeight {
    if (screenWidth > 1200) return 70.0;
    if (screenWidth > 900) return 60.0;
    if (screenWidth > 600) return 50.0;
    return 45.0;
  }
  
  // حساب حجم الخط
  double get fontSize {
    if (screenWidth > 1200) return 22.0;
    if (screenWidth > 900) return 20.0;
    if (screenWidth > 600) return 18.0;
    return 16.0;
  }
  
  // حساب الهوامش
  EdgeInsets get margin => EdgeInsets.only(
    right: screenWidth * 0.04,
    left: screenWidth * 0.04,
    bottom: screenWidth * 0.04,
  );
  
  // حساب التقويس
  double get borderRadius {
    if (screenWidth > 900) return 15.0;
    if (screenWidth > 600) return 12.0;
    return 10.0;
  }
  
  // حساب الحشو الداخلي
  EdgeInsets get padding {
    final verticalPadding = screenWidth > 900 ? 16.0 : 12.0;
    return EdgeInsets.symmetric(vertical: verticalPadding);
  }
}

// مكون نص الزر
class SummaryButtonText extends StatelessWidget {
  final String text;
  final double fontSize;

  const SummaryButtonText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

// الزر الرئيسي
class CustomButttonSumaary extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButttonSumaary({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizes = SummaryButtonSizeHelper(context);

    return Padding(
      padding: sizes.margin,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: sizes.buttonWidth,
          ),
          child: SizedBox(
            height: sizes.buttonHeight,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(sizes.borderRadius),
                ),
                padding: sizes.padding,
              ),
              child: SummaryButtonText(
                text: buttonText,
                fontSize: sizes.fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
