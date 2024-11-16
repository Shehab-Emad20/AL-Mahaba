import 'package:almahaba/models/verification._models.dart';
import 'package:dio/dio.dart';

class APIService {
  static const String port = "8000";
  final Dio dio = Dio();

  Future<VerificationResponseModel> verifyCode(
      String email, String code) async {
    String url = "http://localhost:$port/api/checkcode";

    try {
      final response = await dio.post(
        url,
        data: {
          "email": email,
          "code": code,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 400) {
        return VerificationResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to verify code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error during verification: $e");
    }
  }
}
