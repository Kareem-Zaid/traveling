import 'package:flutter/material.dart';
import 'models.dart';
import 'trip_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key, required this.favoriteTrips});
  static const route = '/favorites';
  final List<Trip> favoriteTrips;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteTrips.isEmpty) {
      return const Center(child: Text('لا يوجد أي عناصر بقائمة المفضلة'));
    } else {
      return ListView.builder(
        itemCount: widget.favoriteTrips.length,
        itemBuilder: (context, index) => TripItem(
          title: widget.favoriteTrips[index].title,
          imageLink: widget.favoriteTrips[index].tripImageURL,
          duration: widget.favoriteTrips[index].duration,
          season: widget.favoriteTrips[index].season,
          id: widget.favoriteTrips[index].id,
          tripType: widget.favoriteTrips[index].tripType,
          refresh: () => setState(() {}),
        ),
      );
    }
  }
}
