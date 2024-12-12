import 'package:almahaba/services/Page_images/image_models.dart';
import 'package:almahaba/services/Page_images/api_image_models.dart';
import 'package:almahaba/utils/end_points.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key});

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
        baseUrl: '${EndPoints.BASE_URL}'); // baseUrl لم يعد ضرورياً
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
          title: const Text('Car Image'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: cars?.length,
                itemBuilder: (context, index) {
                  final car = cars?[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        '${EndPoints.BASE_URL}/${car!.image}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }));
  }
}
