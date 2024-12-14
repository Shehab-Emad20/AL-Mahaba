import 'package:almahaba/tripsummary/orders_model.dart';
import 'package:almahaba/tripsummary/widgets/custom_button_drive.dart';
import 'package:almahaba/tripsummary/widgets/order_components/car_info.dart';
import 'package:almahaba/tripsummary/widgets/order_components/time_info.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  final List<MyOrderModel> orderData;

  const OrdersList({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: orderData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CarInfo(
              carType: orderData.car,
              tripType: orderData.type,
            ),
            // LocationInfo(
            //   from: orderData.from,
            //   to: orderData.to,
            // ),
            TimeInfo(
              date: orderData.date,
              time: orderData.time,
            ),
            const SizedBox(height: 16),
            const CustomButtonAddDrive(),
          ],
        ),
      ),
    );
  }
}
