import '../../../data/models/featured_service.dart';
import 'package:flutter/material.dart';

class FeaturedServiceDisplay extends StatelessWidget {
  final List<FeaturedService> featuredServiceList;
  const FeaturedServiceDisplay({
    super.key,
    required this.featuredServiceList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Featured Services',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 175,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: featuredServiceList.length,
            itemBuilder: (context, index) {
              return imageContainer(
                featuredService: featuredServiceList[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget imageContainer({required FeaturedService featuredService}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(featuredService.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 3 / 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        featuredService.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rs ${featuredService.price.toString()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
