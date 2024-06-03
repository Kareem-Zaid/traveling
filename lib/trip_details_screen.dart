import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:traveling/app_data.dart';
// import 'package:traveling/models.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});
  static const route = '/trip-details';
  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = tripsData.firstWhere((trip) => trip.id == tripId);
    // print(selectedTrip);

    return Scaffold(
      appBar: AppBar(title: Text(selectedTrip.title)),
      body: SingleChildScrollView(
        // SingleChildScrollView is used as a parent to prevent vertical overflow
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(imageUrl: selectedTrip.tripImageURL),
            buildSectionTitle(context, 'الأنشطة'),
            // Here we have to parent ListView with a Container with specific height to see the content of the ListView. (Actually I don't have an interpretation for such a behavior)
            buildListViewContainer(selectedTrip.activities),
            buildSectionTitle(context, 'البرنامج'),
            buildListViewContainer(selectedTrip.program),
          ],
        ),
      ),
    );
  }

  Container buildListViewContainer(List<String> item) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      child: ListView.builder(
          itemCount: item.length,
          itemBuilder: ((ctx, ndx) => Container(
                padding: const EdgeInsets.all(5),
                // elevation: 0.27,
                child: Text(item[ndx]),
              ))),
    );
  }

  Container buildSectionTitle(BuildContext c, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(top: 10),
      alignment: Alignment.topRight,
      child: Text(titleText, style: Theme.of(c).textTheme.bodyLarge),
    );
  }
}
