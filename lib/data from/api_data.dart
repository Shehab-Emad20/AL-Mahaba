import 'package:almahaba/utils/end_points.dart';
import 'package:dio/dio.dart';
import 'package:almahaba/data%20from/models_data.dart';

class ApiServicedataform {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '${EndPoints.BASE_URL}', // عدّل إلى IP الخادم
    ),
  );

  Future<void> createOrder(User user) async {
    try {
      final response = await _dio.post(
        '/order', // استخدم Endpoint بدون Base URL
        data: user.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // أضف أي Headers إضافية هنا إذا لزم الأمر
          },
        ),
      );

      // التحقق من نجاح الطلب
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Order created successfully: ${response.data}');
      } else {
        print('Unexpected response: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        print('Error: Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        print('Error: Receive timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        print('Server responded with error: ${e.response?.statusCode}');
        print('Error details: ${e.response?.data}');
      } else {
        print('Unexpected error: ${e.message}');
      }
    } catch (e) {
      // للتعامل مع أي استثناءات أخرى
      print('An unexpected error occurred: $e');
    }
  }
}
