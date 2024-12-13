import 'package:almahaba/RepliesPage/widgets/text_orders.dart';
import 'package:almahaba/orders/card_orders.dart';
import 'package:almahaba/orders/image_orders.dart';
import 'package:flutter/material.dart';

class RepliesPage extends StatelessWidget {
  const RepliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate responsive dimensions
            double maxWidth = constraints.maxWidth;
            double horizontalPadding = maxWidth * 0.03;
            double cardWidth = maxWidth > 900 
                ? 800 
                : maxWidth > 600 
                    ? maxWidth * 0.8 
                    : maxWidth * 0.94;

            return SingleChildScrollView(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: cardWidth,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title and description with responsive padding
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: maxWidth > 600 ? 24.0 : 16.0,
                        ),
                        child: const TextOrders(),
                      ),

                      // Card to display the order details
                      Card(
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
                              // Responsive sizing for card content
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
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
