import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/models/category.dart';
import '../../data/models/featured_service.dart';
import '../../data/models/offer.dart';
import '../../data/models/popular_service.dart';
import '../../domain/database_service.dart';
import '../widgets/home_widgets/appbar_home.dart';
import '../widgets/home_widgets/offer_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Offer> offerList;
  late List<FeaturedService> featureServiceList;
  late List<Category> categoryList;
  late List<PopularService> popularServiceList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarHome(),
      body: getOffer(),
    );
  }

  Widget getOffer() {
    return StreamBuilder<List<Offer>>(
      stream: DatabaseService.getDataOffer(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          offerList = snapshot.data!;
          return getFeaturedServices();
        } else if (snapshot.hasError) {
          return throw Exception(snapshot.error.toString());
        } else {
          return loadingWidget();
        }
      },
    );
  }

  Widget getFeaturedServices() {
    return StreamBuilder<List<FeaturedService>>(
      stream: DatabaseService.getDataFeaturedService(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          featureServiceList = snapshot.data!;
          return getCategory();
        } else if (snapshot.hasError) {
          return throw Exception(snapshot.error.toString());
        } else {
          return loadingWidget();
        }
      },
    );
  }

  Widget getCategory() {
    return StreamBuilder<List<Category>>(
      stream: DatabaseService.getDataCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          categoryList = snapshot.data!;
          return getMostPopularService();
        } else if (snapshot.hasError) {
          return throw Exception(snapshot.error.toString());
        } else {
          return loadingWidget();
        }
      },
    );
  }

  Widget getMostPopularService() {
    return StreamBuilder<List<PopularService>>(
      stream: DatabaseService.getDataPopularService(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          popularServiceList = snapshot.data!;
          return body();
        } else if (snapshot.hasError) {
          return throw Exception(snapshot.error.toString());
        } else {
          return loadingWidget();
        }
      },
    );
  }

  Widget body() {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OfferDisplay(
              offerList: offerList,
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
