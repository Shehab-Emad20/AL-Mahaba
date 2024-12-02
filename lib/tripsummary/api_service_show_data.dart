import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiceShowData {
  final Dio _dio;

  ApiServiceShowData()
      : _dio = Dio(BaseOptions(
          baseUrl: 'http://localhost:8000/api/',
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<Map<String, dynamic>> fetchOrders() async {
    try {
      Response response = await _dio.get('/myorder');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print('Unauthorized: Please check your token');
      }
      throw Exception('Failed to load data: ${e.response?.statusMessage}');
    }
  }
}
