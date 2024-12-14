import 'package:almahaba/tripsummary/orders_model.dart';

import 'package:almahaba/utils/end_points.dart';
import 'package:dio/dio.dart';

class ApiServiceShowData {
  final Dio _dio;

  ApiServiceShowData()
      : _dio = Dio(BaseOptions(
          baseUrl: '${EndPoints.BASE_URL}/',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            // 'token': KToken
            // 'token':
            //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3NTM1N2UwNzA1NTI4MmRmZTlhYzIxNyIsImlhdCI6MTczMzk5MDQ2NCwiZXhwIjoxNzY1Njk5MjY0fQ.TvM9iaSfDMWiFZS1Zfk8kZ4Cd_yEE4Dg4KzHm26PhBw'
          },
        ));

  Future<List<MyOrderModel>> fetchOrders() async {
    try {
      Response response = await _dio.get('orders');

      print('@@@@@@ ${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<MyOrderModel> orderModel = [];
        for (var item in response.data['data']) {
          orderModel.add(MyOrderModel.fromJson(item));
        }
        return orderModel;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.response?.statusMessage}');
    }
  }
}
