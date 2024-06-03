import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/widgets.dart';
import 'package:traveling/models.dart';

import 'trip_details_screen.dart';

class TripItem extends StatelessWidget {
  const TripItem(
      {super.key,
      required this.title,
      required this.imageLink,
      required this.duration,
      required this.season,
      required this.id,
      required this.tripType});

  final String title, imageLink, id;
  final int duration;
  final Season season;
  final TripType tripType;

  String get seasonText {
    switch (season) {
      case Season.winter:
        return 'شتاء';
      case Season.spring:
        return 'ربيع';
      case Season.summer:
        return 'صيف';
      case Season.autumn:
        return 'خريف';
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.activities:
        return 'أنشطة';

      case TripType.exploration:
        return 'استكشاف';
      case TripType.recovery:
        return 'نقاهة';
      case TripType.therapy:
        return 'علاج';
      default:
        return 'غير معروف';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(TripDetailsScreen.route, arguments: id),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                // alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageLink,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomRight,
                      height: 250,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(.9)
                          ],
                          stops: const [0.5, 1],
                        ),
                      ),
                      child: Text(title,
                          style: Theme.of(context).textTheme.titleLarge)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer_outlined,
                            color: Theme.of(context).primaryColor),
                        const SizedBox(width: 6),
                        Text('$duration ${duration <= 10 ? 'أيام' : 'يوما'}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.sunny_snowing,
                            color: Theme.of(context).primaryColor),
                        const SizedBox(width: 6),
                        Text(seasonText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.travel_explore_outlined,
                            color: Theme.of(context).primaryColor),
                        const SizedBox(width: 6),
                        Text(tripTypeText),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
