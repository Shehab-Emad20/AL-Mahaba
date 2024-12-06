import 'package:almahaba/form/models_oreder.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> createTrip(Trip trip, String token) async {
    try {
      final response = await _dio.post(
        'http://localhost:8000/api/order',
        data: trip.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Content type header
            'token': token, // Add the Authorization header with the token
          },
        ),
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Trip created successfully: ${response.data}');
      } else {
        print('Error: ${response.statusCode}, ${response.data}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
