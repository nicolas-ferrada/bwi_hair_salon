import 'abstract_section.dart';

class Category extends Section {
  Category({
    required super.title,
    required super.image,
    required super.category,
  });
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      title: map['title'] as String,
      image: map['image'] as String,
      category: map['category'] as String,
    );
  }
}
