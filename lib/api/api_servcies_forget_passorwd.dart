import 'package:almahaba/models/forgot_password_models.dart';
import 'package:dio/dio.dart';

class APIService {
  static const String port = "8000";
  final Dio dio = Dio();

  Future<ForgotPasswordResponseModel> forgotPassword(String email) async {
    String url = "http://localhost:$port/api/forgetpass";

    try {
      final response = await dio.post(
        url,
        data: {"email": email}, // إرسال البريد الإلكتروني
        options: Options(
          headers: {
            "Content-Type": "application/json", // تحديد نوع المحتوى
          },
        ),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 400) {
        // تحليل الاستجابة وإرجاع النموذج
        return ForgotPasswordResponseModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to send verification code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error during forgot password process: $e");
    }
  }
}
