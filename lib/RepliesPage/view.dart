import 'package:flutter/material.dart';
import 'package:almahaba/RepliesPage/widgets/text_orders.dart';
import 'package:almahaba/RepliesPage/widgets/order_card.dart';
import 'package:almahaba/RepliesPage/widgets/responsive_container.dart';
import 'package:almahaba/RepliesPage/widgets/responsive_helper.dart';

class RepliesPage extends StatelessWidget {
  const RepliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final cardWidth = ResponsiveHelper.getCardWidth(maxWidth);
            final horizontalPadding = ResponsiveHelper.getHorizontalPadding(maxWidth);
            final verticalPadding = ResponsiveHelper.getVerticalPadding(maxWidth);

            return SingleChildScrollView(
              child: ResponsiveContainer(
                maxWidth: cardWidth,
                horizontalPadding: horizontalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: verticalPadding),
                      child: const TextOrders(),
                    ),
                    OrderCard(maxWidth: maxWidth),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
