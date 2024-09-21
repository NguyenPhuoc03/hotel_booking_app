import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  final String? bid;
  final String guestId;
  final String roomId;
  final String typeRoom;
  final List<String> roomName;
  final DateTime checkIn;
  final DateTime checkOut;
  final int bookingPrice;

  Booking({
    this.bid,
    required this.guestId,
    required this.roomId,
    required this.typeRoom,
    required this.roomName,
    required this.checkIn,
    required this.checkOut,
    required this.bookingPrice,
  });

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Booking(
      bid: doc.id,
      guestId: data['guestId'] ?? "Error",
      roomId: data['roomId'] ?? "Error",
      typeRoom: data['typeRoom'] ?? "Error",
      roomName:
          data['roomName'] != null ? List<String>.from(data['roomName']) : [],
      //neu co loi thi tra ve 01-01-2000
      checkIn: data['checkIn'] != null
          ? (data['checkIn'] as Timestamp).toDate()
          : DateTime(2000),
      checkOut: data['checkOut'] != null
          ? (data['checkOut'] as Timestamp).toDate()
          : DateTime(2000),
      bookingPrice: data['bookingPrice'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'guestId': guestId,
      'roomId': roomId,
      'typeRoom': typeRoom,
      'roomName': roomName,
      'checkIn': Timestamp.fromDate(checkIn),
      'checkOut': Timestamp.fromDate(checkOut),
      'bookingPrice': bookingPrice,
    };
  }
}
