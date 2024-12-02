class OrderModel {
  final From from;
  final To to;
  final User user;
  final String id;
  final String date;
  final String time;
  final String notes;
  final String type;
  final String car;

  OrderModel({
    required this.from,
    required this.to,
    required this.user,
    required this.id,
    required this.date,
    required this.time,
    required this.notes,
    required this.type,
    required this.car,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      from: From.fromJson(json['from']),
      to: To.fromJson(json['to']),
      user: User.fromJson(json['user']),
      id: json['_id'],
      date: json['date'],
      time: json['time'],
      notes: json['notes'],
      type: json['type'],
      car: json['car'],
    );
  }
}

class From {
  final String governorate;
  final String region;
  final String explain;

  From({
    required this.governorate,
    required this.region,
    required this.explain,
  });

  factory From.fromJson(Map<String, dynamic> json) {
    return From(
      governorate: json['governorate'],
      region: json['region'],
      explain: json['explain'],
    );
  }
}

class To {
  final String governorate;
  final String region;
  final String explain;

  To({
    required this.governorate,
    required this.region,
    required this.explain,
  });

  factory To.fromJson(Map<String, dynamic> json) {
    return To(
      governorate: json['governorate'],
      region: json['region'],
      explain: json['explain'],
    );
  }
}

class User {
  final String id;
  final String name;
  final String phone;
  final String whats;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.whats,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      whats: json['whats'],
      age: json['age'],
    );
  }
}
