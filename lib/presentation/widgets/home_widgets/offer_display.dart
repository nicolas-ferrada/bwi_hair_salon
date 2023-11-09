import 'package:flutter/material.dart';

import '../../../data/models/offer.dart';

class OfferDisplay extends StatelessWidget {
  final List<Offer> offerList;
  const OfferDisplay({
    super.key,
    required this.offerList,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15.0),
          // image:
          //     DecorationImage(image: const NetworkImage(''  ), fit: BoxFit.cover),
        ),
        child: Text(offerList[0].description),
      ),
    );
  }
}
