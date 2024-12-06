import 'package:almahaba/tripsummary/view.dart';
import 'package:dio/dio.dart';
import 'package:almahaba/auth/login/model.dart';

class APIServiceLogin {
  static const String port = "8000"; // المنفذ
  final Dio dio = Dio();

  Future<LoginResponeModel> login(LoginRequestModel requestModel) async {
    String url = "http://localhost:$port/api/login";

    try {
      final response = await dio.post(
        url,
        data: requestModel.toJson(), // إرسال بيانات الطلب
        options: Options(
          headers: {
            "Content-Type": "application/json", // تحديد نوع المحتوى
          },
        ),
      );

      print(response);

      // إذا كانت الاستجابة ناجحة
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 400) {
            ApiManager.token = response.data['token'];
        // تحليل JSON وإرجاع النموذج
        return LoginResponeModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error during login: $e");
    }
  }
}
