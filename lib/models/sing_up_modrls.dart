class SignupResponseModel {
  final String message;
  final String name;
  final String email;
  final String token;
  final String role;

  SignupResponseModel({
    required this.message,
    required this.name,
    required this.email,
    required this.token,
    required this.role,
  });

  // تحويل JSON إلى كائن Dart
  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json['message'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
      role: json['role'],
    );
  }

  // تحويل كائن Dart إلى JSON (إذا احتجت لإرسال هذه البيانات)
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'name': name,
      'email': email,
      'token': token,
      'role': role,
    };
  }
}
