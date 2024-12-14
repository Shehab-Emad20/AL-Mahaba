import 'package:flutter/material.dart';
import 'widgets/info_item.dart';
import 'widgets/order_info.dart';
import 'widgets/responsive_sizes.dart';

class CardOrders extends StatelessWidget {
  const CardOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sizes = ResponsiveSizes.fromWidth(constraints.maxWidth);
        final orderInfoList = OrderInfoList.getOrderInfo();
        
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(constraints.maxWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var i = 0; i < orderInfoList.length; i++) ...[
                    if (i > 0) SizedBox(height: sizes.spacing),
                    InfoItem(
                      icon: orderInfoList[i].icon,
                      text: orderInfoList[i].text,
                      iconColor: orderInfoList[i].iconColor,
                      iconSize: sizes.iconSize,
                      fontSize: sizes.fontSize,
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
