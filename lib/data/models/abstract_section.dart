abstract class Section {
  final String title;
  final String image;
  final String category;

  const Section({
    required this.title,
    required this.image,
    required this.category,
  });

  void getData();
}