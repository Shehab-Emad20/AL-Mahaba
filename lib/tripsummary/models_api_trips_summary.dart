class Address {
  final String governorate;
  final String region;
  final String explain;

  Address(
      {required this.governorate, required this.region, required this.explain});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      governorate: json['governorate'],
      region: json['region'],
      explain: json['explain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'governorate': governorate,
      'region': region,
      'explain': explain,
    };
  }
}

class User {
  final String name;
  final String phone;
  final String whats;
  final String age;

  User(
      {required this.name,
      required this.phone,
      required this.whats,
      required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      whats: json['whats'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'whats': whats,
      'age': age,
    };
  }
}

class Order {
  final Address from;
  final Address to;
  final String date;
  final String time;
  final String notes;
  final String type;
  final String car;
  final User user;

  Order({
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.notes,
    required this.type,
    required this.car,
    required this.user,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      from: Address.fromJson(json['from']),
      to: Address.fromJson(json['to']),
      date: json['date'],
      time: json['time'],
      notes: json['notes'],
      type: json['type'],
      car: json['car'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from.toJson(),
      'to': to.toJson(),
      'date': date,
      'time': time,
      'notes': notes,
      'type': type,
      'car': car,
      'user': user.toJson(),
    };
  }
}
