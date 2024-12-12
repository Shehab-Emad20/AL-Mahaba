import 'package:almahaba/tripsummary/api_service_show_data.dart';
import 'package:almahaba/tripsummary/models/orders_model.dart';
import 'package:almahaba/tripsummary/widgets/orders_list.dart';
import 'package:flutter/material.dart';

class TripSummary extends StatefulWidget {
  TripSummary({super.key});

  @override
  _TripSummaryState createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  final ApiServiceShowData _apiService = ApiServiceShowData();

  @override
  void initState() {
    super.initState();
    fetchOrder();
  }

  List<MyOrderModel> ordersModelList = [];
  Future<void> fetchOrder() async {
    try {
      var data = await _apiService.fetchOrders();
      setState(() {
        ordersModelList = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ordersModelList.isEmpty
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
                child: RefreshIndicator(
                    onRefresh: () async {
                      fetchOrder();
                    },
                    child: OrdersList(orderData: ordersModelList)),
              ),
            ));
  }
}
