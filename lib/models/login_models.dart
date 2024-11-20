class LoginResponeModel {
  final String token; // Example, change based on your API response
  final String message;

  LoginResponeModel({required this.token, required this.message});

  factory LoginResponeModel.fromJson(Map<String, dynamic> json) {
    return LoginResponeModel(
      token: json['token'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'message': message,
    };
  }
}
