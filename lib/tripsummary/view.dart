import 'package:almahaba/tripsummary/api_service_show_data.dart';
import 'package:almahaba/tripsummary/orders_model.dart';
import 'package:almahaba/tripsummary/widgets/responsive_order_widget.dart';
import 'package:flutter/material.dart';

class TripSummary extends StatefulWidget {
  const TripSummary({super.key});

  @override
  _TripSummaryState createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  final ApiServiceShowData _apiService = ApiServiceShowData();
  List<MyOrderModel> ordersModelList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOrder();
  }

  Future<void> fetchOrder() async {
    setState(() => isLoading = true);
    try {
      var data = await _apiService.fetchOrders();
      setState(() {
        ordersModelList = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: _buildContent(),
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (ordersModelList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline,
              size: 48,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'لا توجد بيانات للعرض',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: fetchOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'تحديث البيانات',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: fetchOrder,
      child: ResponsiveOrdersList(orderData: ordersModelList),
    );
  }
}
