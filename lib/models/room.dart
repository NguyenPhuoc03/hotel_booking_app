import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String? rid; // la duy nhat dung de quan li tren firebase
  final String
      type; // la duy nhat, quan li bang ten, moi id la 1 tye, moi type la 1 id
  final String description;
  final List<String> image;
  final int maxOccupancy;
  final int roomPrice;
  final Map<String, bool> roomName; //true co the cho thue (trong)
  final List<String> utilities;
  final String hotelId;
  

  Room({
    this.rid,
    required this.type,
    required this.description,
    required this.image,
    required this.maxOccupancy,
    required this.roomPrice,
    required this.roomName,
    required this.utilities,
    required this.hotelId,
  });

  factory Room.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Room(
      rid: doc.id,
      type: data['type'] ?? 'Unknown Type',
      description: data['description'] ?? 'No description available',
      image: data['image'] != null ? List<String>.from(data['image']) : [],
      maxOccupancy: data['maxOccupancy'] ?? 0,
      roomPrice: data['roomPrice'] ?? 0,
      roomName: data['roomName'] != null
          ? Map<String, bool>.from(data['roomName'])
          : {},
      utilities:
          data['utilities'] != null ? List<String>.from(data['utilities']) : [],
      hotelId: data['hotelId'] ?? "Error",
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'description': description,
      'image': image,
      'maxOccupancy': maxOccupancy,
      'roomPrice': roomPrice,
      'roomName': roomName,
      'utilities': utilities,
      'hotelId': hotelId,
    };
  }
}
