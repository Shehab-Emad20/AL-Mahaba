class Orders {
  String? message;
  Data? data;

  Orders({this.message, this.data});

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  Location? from;
  Location? to;
  DateTime? date;
  String? time;
  String? notes;
  String? car;

  Data({this.from, this.to, this.date, this.time, this.notes, this.car});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      from: json['from'] != null ? Location.fromJson(json['from']) : null,
      to: json['to'] != null ? Location.fromJson(json['to']) : null,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      time: json['time'],
      notes: json['notes'],
      car: json['car'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from?.toJson(),
      'to': to?.toJson(),
      'date': date?.toIso8601String(),
      'time': time,
      'notes': notes,
      'car': car,
    };
  }
}

class Location {
  String? governorate;
  String? region;
  String? explain;

  Location({this.governorate, this.region, this.explain});

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
