import 'package:flutter/material.dart';

class TextOrders extends StatelessWidget {
  const TextOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive dimensions
        double screenWidth = MediaQuery.of(context).size.width;
        double titleSize = screenWidth > 900 
            ? 28.0 
            : screenWidth > 600 
                ? 24.0 
                : 20.0;
        double subtitleSize = screenWidth > 900 
            ? 18.0 
            : screenWidth > 600 
                ? 16.0 
                : 14.0;
        double verticalSpacing = screenWidth > 900 
            ? 20.0 
            : screenWidth > 600 
                ? 16.0 
                : 12.0;
        
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: verticalSpacing,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الردود',
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: verticalSpacing),
                Text(
                  'استعراض جميع الردود المتعلقة بالطلب',
                  style: TextStyle(
                    fontSize: subtitleSize,
                    color: Colors.grey[700],
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
