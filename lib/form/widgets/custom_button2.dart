import 'package:flutter/material.dart';

// مساعد لحساب الأحجام المتجاوبة للزر
class ButtonSizeHelper {
  final BuildContext context;
  
  ButtonSizeHelper(this.context);
  
  double get screenWidth => MediaQuery.of(context).size.width;
  
  double get horizontalPadding {
    if (screenWidth > 1200) return 60;
    if (screenWidth > 900) return 50;
    if (screenWidth > 600) return 40;
    return 20;
  }
  
  double get verticalPadding {
    if (screenWidth > 1200) return 30;
    if (screenWidth > 900) return 25;
    if (screenWidth > 600) return 20;
    return 15;
  }
  
  double get fontSize {
    if (screenWidth > 1200) return 18;
    if (screenWidth > 900) return 16;
    if (screenWidth > 600) return 14;
    return 12;
  }
  
  double get buttonWidth {
    if (screenWidth > 1200) return screenWidth * 0.4;
    if (screenWidth > 900) return screenWidth * 0.5;
    if (screenWidth > 600) return screenWidth * 0.7;
    return screenWidth * 0.85;
  }
  
  EdgeInsets get margin => EdgeInsets.only(
    left: screenWidth * 0.05,
    right: screenWidth * 0.05,
    bottom: screenWidth * 0.04,
  );
}

// نص الزر
class ButtonText extends StatelessWidget {
  final double fontSize;

  const ButtonText({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'ستتواصل معك خدمة العملاء في أقرب وقت لتحديد التكلفة بعد ارسال طلب الرحلة',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// الزر الرئيسي
class CustomButtontrip extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomButtontrip({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizes = ButtonSizeHelper(context);

    return Padding(
      padding: sizes.margin,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: sizes.buttonWidth,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(
                horizontal: sizes.horizontalPadding,
                vertical: sizes.verticalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onPressed ?? () {
              // يمكن إضافة الإجراء الافتراضي هنا
            },
            child: ButtonText(fontSize: sizes.fontSize),
          ),
        ),
      ),
    );
  }
}
