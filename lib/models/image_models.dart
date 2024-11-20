class Car {
  final String type;
  final String name;
  final String image;
  final int year;

  Car({
    required this.type,
    required this.name,
    required this.image,
    required this.year,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      type: json['type'],
      name: json['name'],
      image: json['image'],
      year: json['year'],
    );
  }
}
