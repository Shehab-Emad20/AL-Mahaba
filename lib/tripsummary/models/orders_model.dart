class MyOrderModel {
  From? from;
  From? to;
  User? user;
  String? sId;
  String? date;
  String? time;
  String? notes;
  String? type;
  String? returnDate;
  String? returntime;
  String? car;
  List<String>? replays;
  int? iV;

  MyOrderModel(
      {this.from,
      this.to,
      this.user,
      this.sId,
      this.date,
      this.time,
      this.notes,
      this.type,
      this.returnDate,
      this.returntime,
      this.car,
      this.replays,
      this.iV});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = json['to'] != null ? new From.fromJson(json['to']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    sId = json['_id'];
    date = json['date'];
    time = json['time'];
    notes = json['notes'];
    type = json['type'];
    returnDate = json['returnDate'];
    returntime = json['returntime'];
    car = json['car'];
    if (json['replays'] != null) {
      replays = <String>[];
      json['replays'].forEach((v) {
        replays!.add(v);
      });
    }
    iV = json['__v'];
  }
}

class From {
  String? governorate;
  String? region;
  String? explain;

  From({this.governorate, this.region, this.explain});

  From.fromJson(Map<String, dynamic> json) {
    governorate = json['governorate'];
    region = json['region'];
    explain = json['explain'];
  }
}

class User {
  String? id;
  String? name;
  String? phone;
  String? whats;
  int? age;

  User({this.id, this.name, this.phone, this.whats, this.age});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    whats = json['whats'];
    age = json['age'];
  }
}
