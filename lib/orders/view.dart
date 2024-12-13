import 'package:almahaba/home/widgets/custom_app_bar.dart';
import 'package:almahaba/home/widgets/drawer_widget.dart';
import 'package:almahaba/orders/page_orders.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatelessWidget {
  const ViewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      endDrawer: const DrawerWidget(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate responsive dimensions
            double horizontalPadding = constraints.maxWidth * 0.03;
            double verticalPadding = 16.0;
            double spacing = constraints.maxWidth * 0.03;
            
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 1200, // Maximum width for very large screens
                    ),
                    child: Wrap(
                      spacing: spacing,
                      runSpacing: 16.0,
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        3,
                        (index) => Container(
                          width: constraints.maxWidth > 900 
                              ? (constraints.maxWidth - (horizontalPadding * 2) - (spacing * 2)) / 3
                              : constraints.maxWidth > 600 
                                  ? (constraints.maxWidth - (horizontalPadding * 2) - spacing) / 2
                                  : constraints.maxWidth - (horizontalPadding * 2),
                          child: const PageOrders(),
                        ),
                      ),
                    ),
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
