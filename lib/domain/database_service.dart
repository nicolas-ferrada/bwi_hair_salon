import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/models/category.dart';
import '../data/models/featured_service.dart';
import '../data/models/offer.dart';
import '../data/models/popular_service.dart';

class DatabaseService {
  static final _db = FirebaseFirestore.instance;

  static Stream<List<Offer>> getDataOffer() async* {
    try {
      QuerySnapshot<Map<String, dynamic>> documents;

      documents = await _db.collection('offer').get();

      List<Offer> dataList = [];

      for (var docSnapshots in documents.docs) {
        final data = Offer.fromMap(docSnapshots.data());
        dataList.add(data);
      }

      yield dataList;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Stream<List<FeaturedService>> getDataFeaturedService() async* {
    try {
      QuerySnapshot<Map<String, dynamic>> documents;

      documents = await _db.collection('featuredService').get();

      List<FeaturedService> dataList = [];

      for (var docSnapshots in documents.docs) {
        final data = FeaturedService.fromMap(docSnapshots.data());
        dataList.add(data);
      }

      yield dataList;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Stream<List<Category>> getDataCategory() async* {
    try {
      QuerySnapshot<Map<String, dynamic>> documents;

      documents = await _db.collection('category').get();

      List<Category> dataList = [];

      for (var docSnapshots in documents.docs) {
        final data = Category.fromMap(docSnapshots.data());
        dataList.add(data);
      }

      yield dataList;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Stream<List<PopularService>> getDataPopularService() async* {
    try {
      QuerySnapshot<Map<String, dynamic>> documents;

      documents = await _db.collection('popularService').get();

      List<PopularService> dataList = [];

      for (var docSnapshots in documents.docs) {
        final data = PopularService.fromMap(docSnapshots.data());
        dataList.add(data);
      }

      yield dataList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
