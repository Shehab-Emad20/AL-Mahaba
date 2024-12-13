import 'package:almahaba/tripsummary/models/orders_model.dart';
import 'package:almahaba/tripsummary/widgets/custom_button_add.dart';
import 'package:almahaba/tripsummary/widgets/custom_button_drive.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  final List<MyOrderModel> orderData;

  const OrdersList({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    print(orderData);
    return Expanded(
      child: ListView.builder(
        itemCount: orderData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 16), // Padding between orders
            child: OrderWidget(orderData: orderData[index]),
          );
        },
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  final MyOrderModel orderData;

  const OrderWidget({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car Type
          Text(
            'مطلوب سيارة ${orderData.car ?? 'غير محدد'}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // Trip Type
          Text(
            'نوع الرحلة: ${orderData.type ?? 'غير محدد'}',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const Divider(thickness: 1, height: 24), // Separator

          // From Location
          Text(
            'من: ${orderData.from?.governorate ?? 'غير محدد'} (${orderData.from?.region ?? 'غير محدد'})',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          // To Location
          Text(
            'إلى: ${orderData.to?.governorate ?? 'غير محدد'} (${orderData.to?.region ?? 'غير محدد'})',
            style: const TextStyle(fontSize: 14),
          ),
          const Divider(thickness: 1, height: 24), // Separator

          // Date Information
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                orderData.date ?? 'غير محدد',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Time Information
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                orderData.time ?? 'غير محدد',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        const   SizedBox(height: 16),
          const CustomButtonAddDrive()
        ],
      ),
    );
  }
}
