import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';
import '../trip_item.dart';
// import 'models.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});
  // final String catId, catTitle;
  static const route = '/trips';

  @override
  Widget build(BuildContext context) {
    // print(displayTrips.length);
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // This exists as we need to call/pass the pushNamed route arguments
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
          imageLink: displayTrips[index].tripImageURL,
          id: displayTrips[index].id,
          duration: displayTrips[index].duration,
          season: displayTrips[index].season,
          tripType: displayTrips[index].tripType,
        ),
        itemCount: displayTrips.length,
      ),
    );
  }
}
