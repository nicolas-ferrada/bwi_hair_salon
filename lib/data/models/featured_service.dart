import 'abstract_section.dart';

class FeaturedService extends Section {
  final double price;

  const FeaturedService({
    required super.title,
    required super.image,
    required super.category,
    required this.price,
  });

  @override
  void getData() {}
}
