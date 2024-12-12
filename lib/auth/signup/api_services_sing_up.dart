import 'package:almahaba/auth/signup/sing_up_modrls.dart';
import 'package:almahaba/utils/end_points.dart';
import 'package:dio/dio.dart';

class APIServiceSignup {
  static const String port = "8000";
  final Dio dio = Dio();

  Future<SignupResponseModel> signup(Map<String, dynamic> requestModel) async {
    String url = "${EndPoints.BASE_URL}/signup";

    try {
      final response = await dio.post(
        url,
        data: requestModel, // إرسال بيانات الطلب
        options: Options(
          headers: {
            "Content-Type": "application/json", // تحديد نوع المحتوى
          },
        ),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 400) {
        // تحليل الاستجابة JSON وإرجاع النموذج
        return SignupResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to sign up: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error during signup: $e");
    }
  }
}
