import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/models/review.dart';

class Hotel {
  final String? hid;
  final String name;
  final String description;
  Map<String, String> address;
  List<String> image;
  final String hostId;
  List<Review> reviews;
  final double avgRating;
  final int totalReview;

  Hotel({
    this.hid,
    required this.name,
    required this.description,
    required this.address,
    required this.image,
    required this.hostId,
    required this.reviews,
    this.avgRating = 0.0,
    this.totalReview = 0,
  });

  factory Hotel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Hotel(
        hid: doc.id,
        name: data['name'],
        description: data['description'],
        address: Map<String, String>.from(data['address']),
        image: List.from(data['image']),
        hostId: data['hostId'],
        reviews: List.from(data['reviews']),
        avgRating: (data['avgRating'] as num).toDouble(),
        totalReview: data['totalReview']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'address': address,
      'image': image,
      'hostId': hostId,
      'reviews': reviews,
      'avgRating': avgRating,
      'totalReview': totalReview
    };
  }
}
