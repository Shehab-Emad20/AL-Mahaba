import 'package:almahaba/tripsummary/models_api_trips_summary.dart';
import 'package:dio/dio.dart';

class APIServiceOrder {
  final Dio dio = Dio(); // إنشاء مثيل من Dio لإرسال الطلبات
  static const String port = "http://localhost:8000"; // المنفذ

  static const String baseUrl = "$port/api/order"; // عنوان الـ API الخاص بك

  Future<Order> createOrder(Order order) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: order.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Order.fromJson(
            response.data); // تحويل استجابة JSON إلى كائن Order
      } else {
        throw Exception(
            "Failed to create order. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred while creating the order: $e");
    }
  }
}
