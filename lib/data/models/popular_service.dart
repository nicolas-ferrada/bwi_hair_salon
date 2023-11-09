import 'abstract_section.dart';

class PopularService extends Section {
  final String location;
  final String distance;
  final double rating;
  final int totalReviews;
  final bool isFavorite;

  PopularService({
    required this.location,
    required this.distance,
    required this.rating,
    required this.totalReviews,
    required this.isFavorite,
    required super.title,
    required super.image,
    required super.category,
  });

  factory PopularService.fromMap(Map<String, dynamic> map) {
    return PopularService(
      location: map['location'] as String,
      distance: map['distance'] as String,
      rating: map['rating'] as double,
      totalReviews: map['totalReviews'] as int,
      isFavorite: map['isFavorite'] as bool,
      title: map['title'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
    );
  }
}
