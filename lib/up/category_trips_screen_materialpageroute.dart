import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';
// import '../trip_item.dart';
// import 'models.dart';

class CategoryTripsScreen extends StatelessWidget {
  CategoryTripsScreen({super.key, required this.catId, required this.catTitle});
  final String catId, catTitle;
  late final displayTrips =
      tripsData.where((element) => element.categories.contains(catId)).toList();

  @override
  Widget build(BuildContext context) {
    // print(displayTrips.length);
    return Scaffold(
      appBar: AppBar(title: const Text('قائمة الرحلات')),
      // body: ListView.builder(
      // itemBuilder: (context, index) =>
      // TripItem(title: displayTrips[index].title),
      // itemCount: displayTrips.length,
      // ),
    );
  }
}
