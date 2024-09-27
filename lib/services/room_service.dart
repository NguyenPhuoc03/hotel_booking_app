import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/utils/config_key.dart';

class RoomService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(ConfigKey.room);

  Future<List<Room>> getRoomsByHotelId(String hid) async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .where(ConfigKey.hotelId, isEqualTo: hid)
          .get();
      return querySnapshot.docs.map((doc) => Room.fromFirestore(doc)).toList();
    } catch (e) {
      print("(room_services1) Error data: $e");
      return [];
    }
  }

  Future<Room?> getRoomById(String rid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _collectionReference.doc(rid).get();
      return Room.fromFirestore(documentSnapshot);
    } catch (e, stacktrace) {
      print("(room_services) Error fetching data: $e");
      print("Stacktrace: $stacktrace");
      return null;
    }
  }

  Future<List<String>> getAvailableRooms(String rid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _collectionReference.doc(rid).get();

      if (documentSnapshot.exists) {
        Room room = Room.fromFirestore(documentSnapshot);

        List<String> availableRoomNames = [];
        room.roomName.forEach((key, value) {
          if (value == true) {
            availableRoomNames.add(key);
          }
        });

        return availableRoomNames;
      } else {
        return [];
      }
    } catch (e) {
      print("(room_services2) Error data: $e");
      return [];
    }
  }

  Future<void> updateRoomAvailability(
      String roomId, List<String> roomNameKeys) async {
    try {
      Map<String, bool> updates = {};
      for (String key in roomNameKeys) {
        updates['roomName.$key'] = false;
      }

      await _collectionReference.doc(roomId).update(updates);
    } catch (e) {
      print("Error updating room availability: $e");
      throw e;
    }
  }
}
