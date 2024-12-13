import 'package:almahaba/home/widgets/custom_app_bar.dart';
import 'package:almahaba/home/widgets/drawer_widget.dart';
import 'package:almahaba/orders/page_orders.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatelessWidget {
  const ViewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(),
        endDrawer: DrawerWidget(),
        body: PageOrders());
  }
}
