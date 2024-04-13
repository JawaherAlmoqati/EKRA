import 'package:cloud_firestore/cloud_firestore.dart';

/// Model class representing user data.
class UserModel {
  final String id;
  String fullName;
  String email;
  String phoneNumber;
  String profilePicture;
  String? bio;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    this.bio,
  });

  /// Static function to create an empty user model.
  static UserModel empty() => UserModel(
      id: '', fullName: '', email: '', phoneNumber: '', profilePicture: '');

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Bio': bio
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        fullName: data['fullName'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        bio: data['Bio'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
