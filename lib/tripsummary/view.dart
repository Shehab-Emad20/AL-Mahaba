import 'package:almahaba/tripsummary/api_service_show_data.dart';
import 'package:almahaba/tripsummary/models_show_order.dart';
import 'package:flutter/material.dart';

class TripSummary extends StatefulWidget {
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
      if (data['success'] && data['data'].isNotEmpty) {
        setState(() {
          orderData = OrderModel.fromJson(data['data'][0]);
        });
      } else {
        print('No data or unsuccessful response');
      }
    } catch (e) {
      print('Error fetching order: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (orderData != null) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مطلوب سيارة ${orderData!.car}',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'نوع الرحلة: ${orderData!.type}',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              Divider(thickness: 1, height: 24, color: Colors.grey),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'من:',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${orderData!.from.governorate} (${orderData!.from.region} -> ${orderData!.to.region})',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'إلى:',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${orderData!.to.governorate} (${orderData!.to.region} -> ${orderData!.to.explain})',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14),
                        ),
                        Divider(thickness: 1, height: 24, color: Colors.grey),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey[600],
                                ),
                                SizedBox(width: 8),
                                Text(
                                  orderData!.date,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey[600],
                                ),
                                SizedBox(width: 8),
                                Text(
                                  orderData!.time,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
