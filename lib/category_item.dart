import 'package:flutter/material.dart';
import 'trips_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.title,
      required this.imageLink,
      required this.id});
  // Here we use these "{}" inside "()" to be able to write "required"
  final String id, title, imageLink;
  @override
  Widget build(BuildContext context) {
    // print(imageUrl);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => Navigator.of(context).pushNamed(
        TripsScreen.route,
        arguments: {'id': id, 'title': title},
        // This replaces that: "builder: (context) => TripsScreen(catId: id, catTitle: title)"
      ),
      child: Stack(
        // alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: imageLink,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Container(
            // padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            // "alignment" has a magic change here!
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(.4),
            ),
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
      ),
    );
  }
}
