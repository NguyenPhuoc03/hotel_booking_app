import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/models/booking.dart';
import 'package:hotel_booking_app/utils/config_key.dart';

class BookingService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(ConfigKey.booking);

  Future<void> createNewBooking(Booking booking) async {
    try {
      await _collectionReference.add(booking.toFirestore());
    } catch (e) {
      print("booking_service: $e");
      throw 'firestore-write-failed';
    }
  }

  Future<bool> updateBooking(String bid, String field, String value) async {
    try {
      await _collectionReference.doc(bid).update({
        field: value,
      });
      print("Cập nhật trạng thái thành công!");
      return true;
    } catch (e) {
      print("booking_service: $e");
      return false;
    }
  }

  Future<List<Booking>> getBookingByUid(String uid) async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .where(ConfigKey.guestId, isEqualTo: uid)
          .get();
      return querySnapshot.docs
          .map((doc) => Booking.fromFirestore(doc))
          .toList();
    } catch (e) {
      print("(booking_services) Error fetching data: $e");
      return [];
    }
  }
}
