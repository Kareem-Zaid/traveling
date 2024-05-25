import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TripItem extends StatelessWidget {
  const TripItem({super.key, required this.title, required this.imageLink});
  final String title, imageLink;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageLink,
    );
  }
}
