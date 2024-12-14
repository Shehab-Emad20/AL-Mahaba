import 'package:flutter/material.dart';
import 'package:almahaba/tripsummary/widgets/available_trips/trips_title.dart';
import 'package:almahaba/tripsummary/widgets/available_trips/trips_subtitle.dart';

class TripsContent extends StatelessWidget {
  const TripsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TripsTitle(),
        SizedBox(height: 8),
        TripsSubtitle(),
      ],
    );
  }
}
