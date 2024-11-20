import 'package:almahaba/models/image_models.dart';
import 'package:almahaba/api/api_image_models.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  late ImageService imageService;
  List<Car>? cars;
  bool isLoading = true;

  // Dynamic parameters
  final String type = 'cars';
  final String param = 'hi';

  @override
  void initState() {
    super.initState();
    imageService = ImageService(
        baseUrl: 'http://localhost:8000'); // baseUrl لم يعد ضرورياً
    fetchCar();
  }

  Future<void> fetchCar() async {
    setState(() {
      isLoading = true;
    });

    final fetchedCars = await imageService.fetchCar(type: type, param: param);

    setState(() {
      cars = fetchedCars;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Car Image'),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: cars?.length,
                itemBuilder: (context, index) {
                  final car = cars?[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        'http://localhost:8000/${car!.image}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }));
  }
}
