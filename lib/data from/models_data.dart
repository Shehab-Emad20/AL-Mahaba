class User {
  final String name;
  final int age;
  final String phone;
  final String whats;

  User({
    required this.name,
    required this.age,
    required this.phone,
    required this.whats,
  });

  // تحويل JSON إلى نموذج User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      phone: json['phone'],
      whats: json['whats'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'phone': phone,
      'whats': whats,
    };
  }
}
