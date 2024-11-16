import 'package:almahaba/models/reset_password.dart';
import 'package:dio/dio.dart';

class APIService {
  static const String port = "8000";
  final Dio dio = Dio();

  Future<ResetPasswordResponseModel> resetPassword(
      String email, String code, String newPassword) async {
    String url = "http://localhost:$port/api/restpass";

    try {
      final response = await dio.post(
        url,
        data: {
          "email": email,
          "code": code,
          "new_password": newPassword,
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
        return ResetPasswordResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to reset password: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error during password reset: $e");
    }
  }
}
