class ResponsiveSizes {
  final double iconSize;
  final double fontSize;
  final double spacing;

  const ResponsiveSizes({
    required this.iconSize,
    required this.fontSize,
    required this.spacing,
  });

  factory ResponsiveSizes.fromWidth(double width) {
    return ResponsiveSizes(
      iconSize: width > 600 ? 40 : 30,
      fontSize: width > 600 ? 16 : 14,
      spacing: width > 600 ? 16 : 12,
    );
  }
}
