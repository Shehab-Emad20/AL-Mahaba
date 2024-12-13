import 'package:almahaba/RepliesPage/widgets/text_orders.dart';
import 'package:almahaba/orders/card_orders.dart';
import 'package:almahaba/orders/image_orders.dart';
import 'package:flutter/material.dart';

class RepliesPage extends StatelessWidget {
  const RepliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 46.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title and description
            const TextOrders(),
            const SizedBox(height: 16),

            // Card to display the order details
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [CardOrders(), SizedBox(height: 16), ImageOrders()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
