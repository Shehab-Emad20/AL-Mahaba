import 'package:dio/dio.dart';

class APIServiceResetPassword {
  static const String port = "8000"; // تأكد من أن السيرفر يعمل على هذا المنفذ
  final Dio dio = Dio();

  Future<ResetPasswordResponseModel> resetPassword(
      String email, String newPassword) async {
    String url =
        "http://localhost:$port/api/restpass"; // استخدام IP المحاكي بدلاً من localhost

    try {
      final response = await dio.post(
        url,
        data: {
          "email": email,
          "newPassword": newPassword,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // إذا كانت الاستجابة ناجحة، تحويل البيانات إلى نموذج من الـ API
        return ResetPasswordResponseModel.fromJson(response.data);
      } else if (response.statusCode == 400) {
        // إذا كانت الاستجابة تشير إلى فشل التحقق أو انتهاء صلاحية الرمز
        String message = response.data['message'] ?? 'Unknown error';
        throw Exception(message); // إرسال رسالة الخطأ كما هي
      } else {
        throw Exception('Failed to reset password: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("حدث خطأ أثناء إعادة تعيين كلمة المرور: $e");
    }
  }
}

class ResetPasswordResponseModel {
  final String message;

  ResetPasswordResponseModel({required this.message});

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      message: json['message'],
    );
  }
}
