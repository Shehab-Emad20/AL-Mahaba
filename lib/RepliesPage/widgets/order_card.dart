import 'package:flutter/material.dart';
import 'package:almahaba/orders/card_orders.dart';
import 'package:almahaba/orders/image_orders.dart';

class OrderCard extends StatelessWidget {
  final double maxWidth;

  const OrderCard({
    super.key,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(
        vertical: maxWidth > 600 ? 16.0 : 12.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(maxWidth > 600 ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, cardConstraints) {
                  return Column(
                    children: [
                      const CardOrders(),
                      SizedBox(
                        height: maxWidth > 600 ? 24.0 : 16.0,
                      ),
                      SizedBox(
                        width: cardConstraints.maxWidth,
                        child: const ImageOrders(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
