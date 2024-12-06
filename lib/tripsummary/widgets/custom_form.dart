import 'package:almahaba/tripsummary/models_show_order.dart';
import 'package:almahaba/tripsummary/view.dart';
import 'package:almahaba/utils/constants.dart';
import 'package:almahaba/home/widgets/custom_app_bar.dart';
import 'package:almahaba/home/widgets/drawer_widget.dart';
import 'package:almahaba/tripsummary/widgets/available_tips_container.dart';
import 'package:almahaba/tripsummary/widgets/custom_button_add.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final List<OrderModel> ShowOrder;
  const CustomForm({super.key, required this.ShowOrder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: const CustomAppBar(),
      endDrawer: const DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16), // مسافة بين العناصر
          const CustomButtonAdd(),
          const AvailableTripsContainer(), // الزر الخاص بك
          TripSummary(
            ShowOrder: ShowOrder,
          ),
        ],
      ),
    );
  }
}
