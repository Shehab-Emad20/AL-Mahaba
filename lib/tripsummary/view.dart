import 'package:almahaba/tripsummary/widgets/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/tripsummary/api_service_show_data.dart';
import 'package:almahaba/tripsummary/models_show_order.dart';

class TripSummary extends StatefulWidget {
  TripSummary({super.key});

  @override
  _TripSummaryState createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  OrderModel? orderData;
  final ApiServiceShowData _apiService = ApiServiceShowData();
  List<OrderModel> ShowOrder = [];

  @override
  void initState() {
    super.initState();
    fetchOrder();
  }

  Future<void> fetchOrder() async {
    try {
      final data = await _apiService.fetchOrders();
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return orderData == null
        ? Center(
            child: InkWell(
              onTap: () {
                fetchOrder();
              },
              child: Text(
                'لا توجد بيانات للعرض',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: OrdersList(orderData: ShowOrder),
              ),
            ));
  }
}
