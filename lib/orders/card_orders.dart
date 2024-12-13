import 'package:flutter/material.dart';

class CardOrders extends StatelessWidget {
  const CardOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive sizes
        double iconSize = constraints.maxWidth > 600 ? 40 : 30;
        double fontSize = constraints.maxWidth > 600 ? 16 : 14;
        double spacing = constraints.maxWidth > 600 ? 16 : 12;
        
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(constraints.maxWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Car Info with icon behind text
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Icon(Icons.car_repair, 
                          color: Colors.blue, 
                          size: iconSize
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: iconSize + 20),
                          Text(
                            'العربية: بسيشي',
                            style: TextStyle(fontSize: fontSize)
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: spacing),
                  
                  // Model Info with icon behind text
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Icon(
                          Icons.directions_car,
                          color: Colors.blue, 
                          size: iconSize
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: iconSize + 20),
                          Text(
                            'موديل: 324',
                            style: TextStyle(fontSize: fontSize)
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: spacing),
                  // Price Info with icon behind text
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child:
                            Icon(Icons.attach_money, color: Colors.green, size: iconSize),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: iconSize + 20), 
                          Text('السعر: 234 جنيه', style: TextStyle(fontSize: fontSize)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
