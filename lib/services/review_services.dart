import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/models/review.dart';
import 'package:hotel_booking_app/utils/config_key.dart';

class ReviewServices {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(ConfigKey.review);

  Future<void> createNewReview(Review review) async {
    try {
      await _collectionReference.add(review.toFirestore());
    } catch (e) {
      print("review_service: $e");
      throw 'firestore-write-failed';
    }
  }
}
