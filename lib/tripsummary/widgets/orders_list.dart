import 'package:almahaba/tripsummary/models_show_order.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  final List<OrderModel> orderData;
  const OrdersList({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    print(orderData);
    return ListView.builder(
      itemCount: orderData.length,
      itemBuilder: (context, index) {
        return OrderWidget(orderData: orderData[index]);
      },
    );
  }
}

class OrderWidget extends StatelessWidget {
  final OrderModel orderData;
  const OrderWidget({super.key, required this.orderData});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مطلوب سيارة ${orderData!.car ?? 'غير محدد'}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'نوع الرحلة: ${orderData!.type ?? 'غير محدد'}',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const Divider(thickness: 1, height: 24),
          Text(
            'من: ${orderData!.from?.governorate ?? 'غير محدد'} (${orderData!.from?.region ?? 'غير محدد'})',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            'إلى: ${orderData!.to?.governorate ?? 'غير محدد'} (${orderData!.to?.region ?? 'غير محدد'})',
            style: const TextStyle(fontSize: 14),
          ),
          const Divider(thickness: 1, height: 24),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                orderData!.date ?? 'غير محدد',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                orderData!.time ?? 'غير محدد',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
