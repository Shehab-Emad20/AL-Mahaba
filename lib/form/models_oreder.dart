import 'package:intl/intl.dart';

class Trip {
  final Location from;
  final Location to;
  final DateTime date;
  final String time;
  final String notes;
  final String type;
  final String car;
  final User user;

  Trip({
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.notes,
    required this.type,
    required this.car,
    required this.user,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      from: Location.fromJson(json['from']),
      to: Location.fromJson(json['to']),
      date: DateTime.parse(json['date']),
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
      'date': DateFormat('yyyy-MM-dd').format(date), // تنسيق التاريخ
      'time': time,
      'notes': notes,
      'type': type,
      'car': car,
      'user': user.toJson(),
    };
  }
}

class Location {
  final String governorate;
  final String region;
  final String explain;

  Location({
    required this.governorate,
    required this.region,
    required this.explain,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
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

  User({
    required this.name,
    required this.phone,
    required this.whats,
    required this.age,
  });

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
