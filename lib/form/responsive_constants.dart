import 'package:flutter/material.dart';

class ResponsiveConstants {
  static double getContainerWidth(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    return isDesktop ? 600.0 : (isTablet ? screenSize.width * 0.8 : screenSize.width * 0.9);
  }

  static double getFontSize(BuildContext context, {bool isTitle = false}) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    
    if (isTitle) {
      return isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0);
    }
    return isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);
  }

  static EdgeInsets getPadding(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    final horizontalPadding = isDesktop ? 32.0 : (isTablet ? 24.0 : 16.0);
    
    return EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: horizontalPadding / 2,
    );
  }

  static double getFieldHeight(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    final isTablet = screenSize.width > 600 && screenSize.width <= 900;
    return isDesktop ? 60.0 : (isTablet ? 50.0 : 45.0);
  }

  static BorderRadius getBorderRadius(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;
    return BorderRadius.circular(isDesktop ? 12.0 : 8.0);
  }
}
