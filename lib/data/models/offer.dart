import 'abstract_section.dart';

class Offer extends Section {
  final String description;
  final String offer;

  const Offer({
    required this.description,
    required this.offer,
    required super.title,
    required super.image,
    required super.category,
  });

  @override
  void getData() {}
}
