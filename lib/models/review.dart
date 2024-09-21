import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String? rid;
  final String guestId;
  final String hotelId;
  final String bookingId;
  final int star;
  final DateTime createAt;
  final DateTime? updateAt;

  Review(
      {this.rid,
      required this.guestId,
      required this.hotelId,
      required this.bookingId,
      required this.star,
      required this.createAt,
      this.updateAt});

  factory Review.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Review(
      rid: doc.id,
      guestId: data['guestId'] ?? "Error",
      hotelId: data['hotelId'] ?? "Error",
      bookingId: data['bookingId'] ?? "Error",
      star: data['star'],
      // chuyen Timestamp thanh DateTime
      createAt:data['createAt'] != null ? (data['createAt'] as Timestamp).toDate() : DateTime(2000),
      updateAt: data['updateAt'] != null
          ? (data['updateAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    final Map<String, dynamic> data = {
      'guestId': guestId,
      'hotelId': hotelId,
      'bookingId': bookingId,
      'star': star,
      // chuyen DateTime thanh Timestamp
      'createAt': Timestamp.fromDate(createAt),
    };

    if (updateAt != null) {
      data['updateAt'] = Timestamp.fromDate(updateAt!);
    }

    return data;
  }
}
