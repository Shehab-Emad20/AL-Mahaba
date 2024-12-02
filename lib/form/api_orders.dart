import 'package:almahaba/form/models_oreder.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  // إرسال طلب جديد إلى API
  Future<void> submitOrder(Orders orderDetails) async {
    try {
      Response response = await _dio.post(
        'http://localhost:8000/api/order', // تأكد من استخدام العنوان الصحيح
        data: {
          'from': {
            'governorate': orderDetails.data!.from!.governorate,
            'region': orderDetails.data!.from!.region,
            'explain': orderDetails.data!.from!.explain,
          },
          'to': {
            'governorate': orderDetails.data!.from!.governorate,
            'region': orderDetails.data!.from!.region,
            'explain': orderDetails.data!.from!.explain,
          },
          'date': orderDetails.data!.date!,
          'time': orderDetails.data!.time!,
          'notes': orderDetails.data!.notes!,
          'car': orderDetails.data!.car!, // إضافة الحقل car
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Order submitted successfully');
      } else {
        throw Exception(
            'Failed to submit order with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred while submitting order: $e');
    }
  }
}
