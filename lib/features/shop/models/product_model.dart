import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekra/features/personalization/models/user_model.dart';

class ProductModel {
  String id;
  String name;
  String image;
  String? description;
  double price;
  double weeklyRate;
  double monthlyRate;
  bool? isFeatured;
  List<String>? images;
  String? availableDate;

  UserModel? user;
  String? userId;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.description,
    required this.monthlyRate,
    required this.weeklyRate,
    this.isFeatured,
    this.images,
    this.user,
    this.availableDate,
    this.userId,
  });

  static ProductModel empty() => ProductModel(
        id: "",
        name: "",
        price: 0.0,
        image: "",
        monthlyRate: 0.0,
        weeklyRate: 0.0,
        user: null,
        availableDate: '',
        userId: '',
      );

  /// Json Format

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'monthlyRate': monthlyRate,
      'weeklyRate': weeklyRate,
      'isFeatured': isFeatured,
      'Images': images,
      'user': user!.toJson(),
      'availableDate': availableDate ?? '',
      'userId': userId,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      name: data['name'] ?? '',
      price: data['price'] != null ? double.tryParse((data['price']!.toString())) ?? 0 : 0,
      image: data['image'] ?? '',
      description: data['description'],
      monthlyRate: data['monthlyRate'] != null ? double.tryParse(data['monthlyRate'].toString()) ?? 0 : 0,
      weeklyRate: data['weeklyRate'] != null ? double.tryParse(data['weeklyRate'].toString()) ?? 0 : 0,
      isFeatured: data['isFeatured'] ?? false,
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      user: data['user'] != null ? UserModel.fromJson(data['user'] ?? {}) : UserModel.empty(),
      availableDate: data['availableDate'] ?? '',
      userId: data['userId'] ?? '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      monthlyRate: json['monthlyRate'],
      weeklyRate: json['weeklyRate'],
      isFeatured: json['isFeatured'],
      images: json['Images'] != null ? List<String>.from(json['Images']) : [],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : UserModel.empty(),
      availableDate: json['availableDate'],
      userId: json['userId'],
    );
  }
}
