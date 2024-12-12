import 'package:almahaba/utils/end_points.dart';
import 'package:dio/dio.dart';
import 'package:almahaba/auth/checkpage/checkcode._models.dart'; // تأكد من أنك تعرف ال model المناسب

class APIServicecheckcode {
  final Dio dio = Dio(); // Dio هو مكتبة لإرسال HTTP requests
  static const String port = "8000"; //
  Future<VerificationResponseModel> verifyCode(
      String email, String code) async {
    String url =
        "${EndPoints.BASE_URL}/checkcode"; // تأكد من أن هذه هي URL الفعلي لل API الخاص بك

    try {
      final response = await dio.post(
        url,
        data: {
          "email": email, // إرسال البريد الإلكتروني
          "code": code, // إرسال الكود المدخل
        },
      );

      // استلام الاستجابة وتفسيرها
      if (response.statusCode == 200) {
        return VerificationResponseModel.fromJson(response.data);
      } else {
        throw Exception("Failed to verify code");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
