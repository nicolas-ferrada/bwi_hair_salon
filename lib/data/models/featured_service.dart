import 'abstract_section.dart';

class FeaturedService extends Section {
  final double price;

  FeaturedService({
    required this.price,
    required super.title,
    required super.image,
    required super.category,
  });

  factory FeaturedService.fromMap(Map<String, dynamic> map) {
    return FeaturedService(
      price: map['price'] as double,
      title: map['title'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
    );
  }
}
