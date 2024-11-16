class LoginResponeModel {
  final String message;
  final String role;
  final String name;
  final String email;
  final String token;

  LoginResponeModel({
    required this.message,
    required this.role,
    required this.name,
    required this.email,
    required this.token,
  });

  // تحويل JSON إلى كائن Dart
  factory LoginResponeModel.fromJson(Map<String, dynamic> json) {
    return LoginResponeModel(
      message: json['message'],
      role: json['role'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }

  // تحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'role': role,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}
