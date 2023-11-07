import 'abstract_section.dart';

class Category extends Section {
  const Category({
    required super.title,
    required super.image,
    required super.category,
  });

  @override
  void getData() {}
}
