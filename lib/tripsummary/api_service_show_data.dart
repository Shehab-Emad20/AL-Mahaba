import 'package:dio/dio.dart';

class ApiServiceShowData {
  final Dio _dio;

  ApiServiceShowData()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://localhost:8000/api/',
        ));

  Future<Map<String, dynamic>> fetchOrders() async {
    try {
      Response response = await _dio.get('/orders');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.response?.statusMessage}');
    }
  }
}
