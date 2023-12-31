import 'package:flutter/material.dart';

import '../../data/models/category.dart';
import '../../data/models/featured_service.dart';
import '../../data/models/offer.dart';
import '../../data/models/popular_service.dart';
import '../../domain/database_service.dart';
import '../utils/color_palette.dart';
import '../widgets/home_widgets/appbar_home.dart';
import '../widgets/home_widgets/featured_service_display.dart';
import '../widgets/home_widgets/offer_display.dart';
import '../widgets/home_widgets/popular_services_display.dart';
import 'category_screen.dart';
import 'coming_soon_screen.dart';
import 'profile_screen.dart';

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

  int currentIndex = 0;

  late final List<Widget> screens = [
    homePage(),
    CategoryScreen(
      categoryList: categoryList,
      isHomePage: false,
      changePageIndex: changePageIndex,
    ),
    const ComingSoonScreen(),
    const ComingSoonScreen(),
    const Profile(),
  ];

  // Callback function to update the index page from category widget
  changePageIndex({required int newIndex}) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return getOffer();
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
    return Scaffold(
      appBar: const AppbarHome(),
      bottomNavigationBar: bottonNavigation(),
      body: screens[
          ((currentIndex == 0) || (currentIndex == 1) || (currentIndex == 4))
              ? currentIndex
              : 2],
    );
  }

  Widget homePage() {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OfferDisplay(offerList: offerList),
            const SizedBox(height: 8),
            FeaturedServiceDisplay(featuredServiceList: featureServiceList),
            CategoryScreen(
              categoryList: categoryList,
              isHomePage: true,
              changePageIndex: changePageIndex,
            ),
            PopularServiceDisplay(popularServiceList: popularServiceList),
          ],
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget bottonNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      selectedItemColor: ColorPalette.darkBlue(),
      unselectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        navigationItem(icon: Icons.home_outlined),
        navigationItem(icon: Icons.grid_view_outlined),
        navigationItem(icon: Icons.calendar_month_outlined),
        navigationItem(icon: Icons.chat_bubble_outline),
        navigationItem(icon: Icons.person_2_outlined),
      ],
    );
  }

  BottomNavigationBarItem navigationItem({
    required IconData icon,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: '',
    );
  }
}
