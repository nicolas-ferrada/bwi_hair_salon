import 'package:flutter/material.dart';

import '../../data/models/category.dart';
import '../utils/color_palette.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categoryList;
  final bool isHomePage;
  final Function({required int newIndex}) changePageIndex;
  const CategoryScreen({
    super.key,
    required this.categoryList,
    required this.isHomePage,
    required this.changePageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 16, horizontal: isHomePage ? 0 : 16),
                child: const Text(
                  'Category',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              isHomePage
                  ? Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              changePageIndex(
                                  newIndex: 1); // category screen index
                            },
                            child: Text(
                              'View all',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorPalette.darkBlue(),
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: calculateNeededSpace(),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 64,
                crossAxisSpacing: 8.0,
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: categoryListLength(),
              itemBuilder: (context, index) {
                final Category category = categoryList[index];
                return imageContainer(category: category);
              },
            ),
          ),
        ],
      ),
    );
  }

  double calculateNeededSpace() {
    const int objectsPerRow = 3;
    const int pixelPerRow = 160;
    int totalObjects = categoryListLength();

    int totalRows = (totalObjects / objectsPerRow).ceil();

    return (totalRows * pixelPerRow).toDouble();
  }

  int categoryListLength() {
    return isHomePage
        ? (categoryList.length > 6 ? 6 : categoryList.length)
        : categoryList.length;
  }

  Widget imageContainer({required Category category}) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(category.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          category.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
