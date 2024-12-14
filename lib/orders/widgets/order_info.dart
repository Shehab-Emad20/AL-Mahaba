import 'package:flutter/material.dart';

class OrderInfo {
  final IconData icon;
  final String text;
  final Color iconColor;

  const OrderInfo({
    required this.icon,
    required this.text,
    required this.iconColor,
  });
}

class OrderInfoList {
  static List<OrderInfo> getOrderInfo() {
    return [
      OrderInfo(
        icon: Icons.car_repair,
        text: 'العربية: بسيشي',
        iconColor: Colors.blue,
      ),
      OrderInfo(
        icon: Icons.directions_car,
        text: 'موديل: 324',
        iconColor: Colors.blue,
      ),
      OrderInfo(
        icon: Icons.attach_money,
        text: 'السعر: 234 جنيه',
        iconColor: Colors.green,
      ),
    ];
  }
}
