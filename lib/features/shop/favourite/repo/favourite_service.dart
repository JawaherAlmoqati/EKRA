import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesService {
  final CollectionReference _favoritesCollection = FirebaseFirestore.instance.collection('favorites');
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addToFavorites(String itemId) async {
    return await _favoritesCollection.doc(userId).update({
      'favorites': FieldValue.arrayUnion([itemId])
    });
  }

  Future<void> removeFromFavorites(String itemId) async {
    return await _favoritesCollection.doc(userId).update({
      'favorites': FieldValue.arrayRemove([itemId])
    });
  }

  Future<List<String>> getFavorites() async {
    if ((await _favoritesCollection.doc(userId).get()).exists) {
      DocumentSnapshot doc = await _favoritesCollection.doc(userId).get();
      return List<String>.from(doc['favorites'] ?? []);
    } else {
      await _favoritesCollection.doc(userId).set({'favorites': []});
      return [];
    }
  }

  Future<List<ProductModel>> getFavoriteProducts(List<String> ids) async {
    List<ProductModel> products = [];
    for (String id in ids) {
      final result = await FirebaseFirestore.instance.collection('products').doc(id).snapshots().first;
      products.add(ProductModel.fromSnapshot(result));
    }
    return products;
  }
}
