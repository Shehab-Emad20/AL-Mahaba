import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth > 600 ? 32.0 : 24.0;
    final iconSize = screenWidth > 600 ? 32.0 : 24.0;

    return DrawerHeader(
      decoration: const BoxDecoration(color: Colors.red),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'AL-MAHABA',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: iconSize,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
