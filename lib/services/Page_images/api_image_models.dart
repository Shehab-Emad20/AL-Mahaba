import 'dart:developer';

import 'package:almahaba/services/Page_images/image_models.dart';
import 'package:dio/dio.dart';

class ImageService {
  final String baseUrl;
  final Dio _dio;

  ImageService({required this.baseUrl}) : _dio = Dio();

  Future<List<Car>> fetchCar(
      {required String type, required String param}) async {
    try {
      final url = '$baseUrl/api/cars';
      log('[INFO] Sending GET request to: $url');

      final response = await _dio.get(url);

      // التحقق من حالة الاستجابة سواء كانت 200 أو 201
      if (response.statusCode == 200 || response.statusCode == 201) {
        final success = response.data['success'];
        // التحقق من أن success إما Boolean أو String أو int
        if (success) {
          final carData = response.data['data'];
          return carData
              .map<Car>((car) => Car.fromJson(car))
              .toList(); // تحويل البيانات إلى كائن Car
        } else {
          log('[WARNING] Failed to fetch car details. "success" is not true.');
          log('[DEBUG] Response data: ${response.data}');
          throw Exception('Failed to load cars');
        }
      } else {
        log('[WARNING] Failed to fetch car details. Status code: ${response.statusCode}');
        log('[DEBUG] Response data: ${response.data}');
        throw Exception('Failed to load cars');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('[ERROR] Dio error occurred. Status code: ${e.response?.statusCode}');
        log('[DEBUG] Error response data: ${e.response?.data}');
      } else {
        log('[ERROR] Network error: ${e.message}');
      }
      throw Exception('Failed to load cars');
    } catch (e) {
      log('[ERROR] An unknown error occurred: $e');
      throw Exception('Failed to load cars');
    }
  }
}
