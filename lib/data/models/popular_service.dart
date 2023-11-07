import 'abstract_section.dart';

class PopularService extends Section {
  final String location;
  final String distance;
  final double rating;
  final int totalReviews;
  final bool isFavorite;

  const PopularService({
    required super.title,
    required super.image,
    required super.category,
    required this.location,
    required this.distance,
    required this.rating,
    required this.totalReviews,
    required this.isFavorite,
  });

  @override
  void getData() {}
}
