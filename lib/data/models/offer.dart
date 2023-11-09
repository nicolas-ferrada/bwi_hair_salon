import 'abstract_section.dart';

class Offer extends Section {
  final String description;
  final String offer;

  Offer({
    required this.description,
    required this.offer,
    required super.title,
    required super.image,
    required super.category,
  });

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
      description: map['description'] as String,
      offer: map['offer'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
    );
  }
}
