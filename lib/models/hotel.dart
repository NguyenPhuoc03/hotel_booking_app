import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  final String? hid;
  final String name;
  final String description;
  Map<String, String> address;
  List<String> image;
  final int discount;
  final String hostId;
  List<String> reviews;
  final double avgRating;
  final int totalReview;
  final int totalBook;
  int? lowestRoomPrice; //byNight

  Hotel({
    this.hid,
    required this.name,
    required this.description,
    required this.address,
    required this.image,
    this.discount = 0,
    required this.hostId,
    required this.reviews,
    this.avgRating = 0.0,
    this.totalReview = 0,
    this.totalBook = 0,
    this.lowestRoomPrice = 0,
  });

  factory Hotel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Hotel(
      hid: doc.id,
      name: data['name'] ?? 'Unknown Name',
      description: data['description'] ?? 'No description available',
      address: data['address'] != null
          ? Map<String, String>.from(data['address'])
          : {},
      image: data['image'] != null ? List<String>.from(data['image']) : [],
      discount: data['discount'] ?? 0,
      hostId: data['hostId'] ?? 'Unknown Host',
      reviews:
          data['reviews'] != null ? List<String>.from(data['reviews']) : [],
      avgRating: (data['avgRating'] as num?)?.toDouble() ?? 0.0,
      totalReview: data['totalReview'] ?? 0,
      totalBook: data['totalBook'] ?? 0,
      lowestRoomPrice: data['lowestRoomPrice'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'address': address,
      'image': image,
      'discount': discount,
      'hostId': hostId,
      'reviews': reviews,
      'avgRating': avgRating,
      'totalReview': totalReview,
      'totalBook': totalBook,
      'lowestRoomPrice': lowestRoomPrice,
    };
  }
}
