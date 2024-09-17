import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/utils/config_key.dart';

class Users {
  final String? uid;
  final String email;
  final String fullName;
  final String avatar;
  final String phoneNumber;
  final String role;
  final DateTime createAt;

  Users({
    this.uid,
    required this.email,
    required this.fullName,
    this.avatar = ConfigKey.avatarUrl,
    required this.phoneNumber,
    this.role = "guest",
    required this.createAt,
  });

  factory Users.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Users(
      uid: doc.id,
      email: data['email'],
      fullName: data['fullName'],
      avatar: data['avatar'],
      phoneNumber: data['phoneNumber'],
      role: data['role'],
      createAt: (data['createAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'fullName': fullName,
      'avatar': avatar,
      'phoneNumber': phoneNumber,
      'role': role,
      'createAt': Timestamp.fromDate(createAt),
    };
  }
}
