import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  final String? bid;
  final String guestId;
  final String roomId;
  final String typeRoom;
  final DateTime checkIn;
  final DateTime checkOut;
  final int bookingPrice;

  Booking({
    this.bid,
    required this.guestId,
    required this.roomId,
    required this.typeRoom,
    required this.checkIn,
    required this.checkOut,
    required this.bookingPrice,
  });

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Booking(
        bid: doc.id,
        guestId: data['guestId'],
        roomId: data['roomId'],
        typeRoom: data['typeRoom'],
        checkIn: (data['checkIn'] as Timestamp).toDate(),
        checkOut: (data['checkOut'] as Timestamp).toDate(),
        bookingPrice: data['bookingPrice']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'guestId': guestId,
      'roomId': roomId,
      'typeRoom': typeRoom,
      'checkIn': Timestamp.fromDate(checkIn),
      'checkOut': Timestamp.fromDate(checkOut),
      'bookingPrice': bookingPrice,
    };
  }
}
