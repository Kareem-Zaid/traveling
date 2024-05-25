import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';
import 'package:traveling/models.dart';
import 'trip_item.dart';
// import 'models.dart';

class TripsScreen extends StatelessWidget {
  static const route = '/trips';
  const TripsScreen(List<Trip> tripsData, {super.key});
  // final String catId, catTitle;

  @override
  Widget build(BuildContext context) {
    // print(displayTrips.length);
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routeArgument['id'];
    final catTitle = routeArgument['title'];
    // This replaces that: "final String catId, catTitle;"
    final displayTrips =
        tripsData.where((e) => e.categories.contains(catId)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(catTitle!)),
      body: ListView.builder(
        itemBuilder: (context, index) => TripItem(
            title: displayTrips[index].title,
            imageLink: displayTrips[index].tripImageURL),
        itemCount: displayTrips.length,
      ),
    );
  }
}
