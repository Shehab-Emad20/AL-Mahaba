import 'package:almahaba/tripsummary/widgets/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:almahaba/tripsummary/api_service_show_data.dart';
import 'package:almahaba/tripsummary/models_show_order.dart';

class TripSummary extends StatefulWidget {
  List<OrderModel> ShowOrder;

  TripSummary({required this.ShowOrder});

  @override
  _TripSummaryState createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  OrderModel? orderData;
  final ApiServiceShowData _apiService = ApiServiceShowData();

  @override
  void initState() {
    super.initState();
    fetchOrder();
  }

 Future<void> fetchOrder() async {
  try {
    final data = await _apiService.fetchOrders();
    if (data['success'] && data['data'] != null && data['data'].isNotEmpty) {
      setState(() {
        widget.ShowOrder = (data['data'] as List)
            .map((order) => OrderModel.fromJson(order))
            .toList();
      });
    } else {
      setState(() {
        widget.ShowOrder = [];
      });
      print('No data or unsuccessful response');
    }
  } catch (e) {
    print('Error fetching order: $e');
    setState(() {
      widget.ShowOrder = [];
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return orderData == null
        ? Center(
            child: Text(
              'لا توجد بيانات للعرض',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
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
                child: OrdersList(orderData: widget.ShowOrder),
              ),
            ));
  }
}
class ApiManager{
  static const String baseUrl = 'http://127.0.0.1:8000';
  static String token = ''; 
  /*
  responsive , 
  state management ,
  
  */
}