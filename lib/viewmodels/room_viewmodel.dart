import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/services/room_service.dart';

class RoomViewmodel extends ChangeNotifier {
  final RoomService _roomService = RoomService();
  bool _isLoading = false;
  bool _isAvailableRoomsLoading = false;

  List<Room> _rooms = [];
  List<String> _availableRooms = [];

  bool get isLoading => _isLoading;
  bool get isAvailableRoomsLoading => _isAvailableRoomsLoading;

  List<Room> get rooms => _rooms;
  List<String> get availableRooms => _availableRooms;

  Future<void> getRooms(String hid) async {
    _isLoading = true;
    notifyListeners();

    _rooms = await _roomService.getRoomsByHotelId(hid);
    if (_rooms.length > 1) {
      _rooms.sort((a, b) =>
          b.roomPrice.compareTo(a.roomPrice)); //sap xep giam dan theo gia
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<List<String>> getAvailableRooms(String? rid) async {
    _isAvailableRoomsLoading = true;
    notifyListeners();

    _availableRooms = await _roomService.getAvailableRooms(rid ?? "e");
    _isAvailableRoomsLoading = false;
    notifyListeners();
    return _availableRooms;
  }

  Future<Room?> getRoomById(String rid) async {

    Room? room = await _roomService.getRoomById(rid);
    notifyListeners();
    return room;
  }
}
