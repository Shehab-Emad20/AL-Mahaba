import 'package:flutter/material.dart';

class CardOrders extends StatelessWidget {
  const CardOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Vehicle Information (Top Image)
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.end, // Align content to the right
            children: [
              // Car Info with icon behind text
              Stack(
                clipBehavior:
                    Clip.none, // Allow the icon to overlap with the text
                children: [
                  Positioned(
                    right: 0, // Position icon to the right of the text
                    top: 0,
                    child: Icon(Icons.car_repair, color: Colors.blue, size: 40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 60),
                      Text('العربية: بسيشي', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Model Info with icon behind text
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(Icons.directions_car,
                        color: Colors.blue, size: 40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 60),
                      Text('موديل: 324', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Price Info with icon behind text
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child:
                        Icon(Icons.attach_money, color: Colors.green, size: 40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 60), // Increased space for icon
                      Text('السعر: 234 جنيه', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
