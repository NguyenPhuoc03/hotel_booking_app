import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String? rid;
  final String type;
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
      type: data['type'],
      description: data['description'],
      image: List.from(data['image']),
      maxOccupancy: data['maxOccupancy'],
      roomPrice: data['roomPrice'],
      roomName: Map<String, bool>.from(data['roomName']),
      utilities: List.from(data['utilities']),
      hotelId: data['hotelId'],
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
