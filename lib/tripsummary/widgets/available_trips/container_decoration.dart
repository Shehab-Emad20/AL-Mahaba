import 'package:flutter/material.dart';

class ContainerDecoration extends BoxDecoration {
  ContainerDecoration()
      : super(
          color: const Color.fromARGB(255, 235, 167, 167),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        );
}
