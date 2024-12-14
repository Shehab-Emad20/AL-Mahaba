class ResponsiveHelper {
  static double getCardWidth(double maxWidth) {
    if (maxWidth > 900) {
      return 800;
    } else if (maxWidth > 600) {
      return maxWidth * 0.8;
    } else {
      return maxWidth * 0.94;
    }
  }

  static double getHorizontalPadding(double maxWidth) {
    return maxWidth * 0.03;
  }

  static double getVerticalPadding(double maxWidth) {
    return maxWidth > 600 ? 24.0 : 16.0;
  }
}
