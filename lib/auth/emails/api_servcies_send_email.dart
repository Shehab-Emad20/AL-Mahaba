import 'package:almahaba/auth/emails/send_email.dart';
import 'package:almahaba/utils/end_points.dart';
import 'package:dio/dio.dart';

class APIServicesendemail {
  static const String port = "8000";
  final Dio dio = Dio();

  Future<ForgotPasswordResponseModel> forgotPassword(String email) async {
    String url = "${EndPoints.BASE_URL}/forgetpass";

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
