import 'package:dio/dio.dart';
import 'package:almahaba/data%20from/models_data.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> createOrder(User user) async {
    try {
      final response = await _dio.post(
        'http://10.0.2.2:8000/api/order',
        data: user.toJson(),
      );
      print('Response: ${response.data}');
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        print('Connection timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        // Changed from 'response' to 'badResponse'
        print('Server responded with error: ${e.response?.statusCode}');
      } else {
        print('Connection error: ${e.message}');
      }
    }
  }
}
