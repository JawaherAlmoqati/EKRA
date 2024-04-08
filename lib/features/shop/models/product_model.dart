import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String name;
  String image;
  String? description;
  double price;
  double weeklyRate;
  double monthlyRate;
  bool? isFeatured;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.description,
    required this.monthlyRate,
    required this.weeklyRate,
    this.isFeatured,
  });

  static ProductModel empty() => ProductModel(
      id: "",
      name: "",
      price: 0.0,
      image: "",
      monthlyRate: 0.0,
      weeklyRate: 0.0);

  /// Json Format

  toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'monthlyRate': monthlyRate,
      'weeklyRate': weeklyRate,
      'isFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      image: data['image'] ?? '',
      description: data['description'],
      monthlyRate: (data['monthlyRate'] ?? 0.0).toDouble(),
      weeklyRate: (data['weeklyRate'] ?? 0.0).toDouble(),
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}
