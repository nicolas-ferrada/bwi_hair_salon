import '../../../data/models/popular_service.dart';
import '../../utils/color_palette.dart';
import '../../utils/compare_booleans.dart';
import 'package:flutter/material.dart';

class PopularServiceDisplay extends StatelessWidget {
  final List<PopularService> popularServiceList;
  const PopularServiceDisplay({
    super.key,
    required this.popularServiceList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          const SizedBox(height: 8),
          filter(),
          const SizedBox(height: 16),
          popularServiceListDisplay(),
        ],
      ),
    );
  }

  Widget popularServiceListDisplay() {
    return SizedBox(
      width: double.infinity,
      height: popularServiceList.length * 200,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: popularServiceList.length,
        itemBuilder: (context, index) {
          // Show favorite services first
          popularServiceList.sort((a, b) =>
              CompareBooleans.compareBooleans(a.isFavorite, b.isFavorite));
          final PopularService popularService = popularServiceList[index];
          return popularServiceContainer(popularService: popularService);
        },
      ),
    );
  }

  Widget popularServiceContainer({
    required PopularService popularService,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(popularService.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                favoriteService(popularService),
                const SizedBox(height: 8),
                titleService(popularService),
                const SizedBox(height: 8),
                locationService(popularService),
                const SizedBox(height: 8),
                distanceService(popularService),
                const SizedBox(height: 8),
                ratingAndTotalReviewsService(popularService),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row distanceService(PopularService popularService) {
    return Row(
      children: [
        Icon(
          Icons.location_on_sharp,
          color: ColorPalette.darkBlue(),
          size: 18,
        ),
        Text(popularService.distance),
      ],
    );
  }

  Widget ratingAndTotalReviewsService(PopularService popularService) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Text(
          popularService.rating.toString(),
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(width: 4),
        const Text(
          '|',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(width: 4),
        Text(
          popularService.totalReviews.toString(),
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(width: 4),
        const Text(
          'reviews',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget locationService(PopularService popularService) {
    return Text(
      popularService.location,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }

  Widget titleService(PopularService popularService) {
    return Text(
      popularService.title,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget favoriteService(PopularService popularService) {
    return Align(
      alignment: Alignment.centerRight,
      child: popularService.isFavorite
          ? const Icon(
              Icons.stars_rounded,
              color: Colors.red,
            )
          : const Icon(
              Icons.star_outline_sharp,
              color: Colors.black,
            ),
    );
  }

  Widget title() {
    return const Text(
      'Most Popular Services',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget filter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        filterTagStyle(name: ' All ', isSelected: true),
        filterTagStyle(name: 'Haircuts', isSelected: false),
        filterTagStyle(name: 'Make up', isSelected: false),
        filterTagStyle(name: 'Manicure', isSelected: false),
      ],
    );
  }

  Widget filterTagStyle({
    required String name,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color:
            isSelected ? ColorPalette.darkBlue() : Colors.blue.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : ColorPalette.darkBlue(),
          ),
        ),
      ),
    );
  }
}
