class OrderModel {
  final String? car;
  final String? type;
  final Location? from;
  final Location? to;
  final String? date;
  final String? time;

  OrderModel({
    this.car,
    this.type,
    this.from,
    this.to,
    this.date,
    this.time,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      car: json['car'],
      type: json['type'],
      from: Location.fromJson(json['from']),
      to: Location.fromJson(json['to']),
      date: json['date'],
      time: json['time'],
    );
  }
}

class Location {
  final String? governorate;
  final String? region;
  final String? explain;

  Location({this.governorate, this.region, this.explain});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      governorate: json['governorate'],
      region: json['region'],
      explain: json['explain'],
    );
  }
}
