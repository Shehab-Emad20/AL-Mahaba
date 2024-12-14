import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconLeft;
  final IconData iconRight;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconLeft,
    required this.iconRight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Responsive sizes
    final containerPadding = screenWidth * 0.04;
    final iconSize = screenWidth * 0.07;
    final titleSize = screenWidth * 0.045;
    final subtitleSize = screenWidth * 0.035;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              iconLeft,
              size: iconSize,
              color: Colors.black,
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: subtitleSize,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Icon(
              iconRight,
              size: iconSize,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
