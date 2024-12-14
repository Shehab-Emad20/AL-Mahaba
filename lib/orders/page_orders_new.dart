import 'package:almahaba/RepliesPage/view.dart';
import 'package:flutter/material.dart';
import 'widgets/order_header.dart';
import 'widgets/location_info.dart';
import 'widgets/datetime_info.dart';
import 'widgets/order_actions.dart';

class PageOrders extends StatelessWidget {
  const PageOrders({super.key});

  void navigateToRepliesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RepliesPage()),
    );
  }

  void deleteOrder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("تم مسح الطلب")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double minHeight = 360;
        double maxHeight = constraints.maxHeight * 0.8;
        double containerHeight = minHeight > maxHeight ? minHeight : maxHeight;
        
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                OrderHeader(maxWidth: constraints.maxWidth),
                
                LocationInfo(maxWidth: constraints.maxWidth),
                
                DateTimeInfo(maxWidth: constraints.maxWidth),
                
                const SizedBox(height: 16),
                
                OrderActions(
                  maxWidth: constraints.maxWidth,
                  onDelete: () => deleteOrder(context),
                  onViewReplies: () => navigateToRepliesPage(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
