import 'package:flutter/material.dart';
import 'package:almahaba/tripsummary/widgets/available_trips/container_decoration.dart';
import 'package:almahaba/tripsummary/widgets/available_trips/trips_content.dart';

class AvailableTripsContainer extends StatelessWidget {
  const AvailableTripsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: ContainerDecoration(),
        child: const TripsContent(),
      ),
    );
  }
}
