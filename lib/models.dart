class Category {
  final String id, title, imageURL;

  const Category(
      {required this.title, required this.imageURL, required this.id});
}

enum Season { winter, spring, summer, autumn }

enum TripType { exploration, recovery, activities, therapy }

class Trip {
  final Season season;
  final TripType tripType;
  final String id, title, tripImageURL;
  final List<String> categories, activities, program;
  final int duration;
  final bool isInSummer, isInWinter, isForFamilies;
  const Trip(
      {required this.season,
      required this.tripType,
      required this.id,
      required this.categories,
      required this.title,
      required this.tripImageURL,
      required this.activities,
      required this.program,
      required this.duration,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
