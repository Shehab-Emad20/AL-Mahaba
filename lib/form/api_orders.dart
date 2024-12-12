import 'package:almahaba/form/models_oreder.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/utils/end_points.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> createTrip(Map trip) async {
    try {
      final response = await _dio.post(
        '${EndPoints.BASE_URL}/order',
        data: trip,
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Content type header
            'token': KToken, // Add the Authorization header with the token
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Trip created successfully: ${response.data}');
        return;
      } else {
        print('Error: ${response.statusCode}, ${response.data}');
        return;
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
