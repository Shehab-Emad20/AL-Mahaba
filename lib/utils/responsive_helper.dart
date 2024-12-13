import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobilePhone(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 900;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  static double getWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (isDesktop(context)) {
      return 600.0;
    } else if (isTablet(context)) {
      return screenWidth * 0.8;
    } else {
      return screenWidth * 0.9;
    }
  }

  static double getFontSize(BuildContext context) {
    if (isDesktop(context)) {
      return 16.0;
    } else if (isTablet(context)) {
      return 14.0;
    } else {
      return 12.0;
    }
  }

  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.all(20.0);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(16.0);
    } else {
      return const EdgeInsets.all(12.0);
    }
  }
}
