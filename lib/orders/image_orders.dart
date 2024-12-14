import 'package:flutter/material.dart';

class ImageOrders extends StatelessWidget {
  final String imagePath;
  final double? height;
  final BorderRadius? borderRadius;

  const ImageOrders({
    super.key,
    this.imagePath = 'assets/images/feed.png',
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive height
        final imageHeight = height ?? 
          (constraints.maxWidth > 600 ? 300.0 : 250.0);
        
        return Container(
          width: double.infinity,
          height: imageHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: borderRadius ?? const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          // Add a gradient overlay for better text visibility if needed
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
