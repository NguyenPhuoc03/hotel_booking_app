import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/utils/config_key.dart';

class RoomService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(ConfigKey.hotel);

  Future<int> getLowestRoomPriceForHotel(String hid) async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .where('hotelId', isEqualTo: hid)
          .orderBy('roomPrice')
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return Room.fromFirestore(querySnapshot.docs.first).roomPrice;
      } else {
        return -1;
      }
    } catch (e, stacktrace) {
      print("(room_services) Error data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return 0;
    }
  }
}
