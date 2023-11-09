import 'package:flutter/material.dart';

import '../../data/models/category.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categoryList;
  const CategoryScreen({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Category'));
  }
}
