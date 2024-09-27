import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/booking.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/models/users.dart';
import 'package:hotel_booking_app/services/booking_service.dart';
import 'package:hotel_booking_app/services/room_service.dart';
import 'package:hotel_booking_app/utils/config_key.dart';

class BookingViewmodel extends ChangeNotifier {
  final BookingService _bookingService = BookingService();
  final RoomService _roomService = RoomService();

  bool _isLoading = false;
  bool _isHistoryLoading = false;
  bool _isPagLoading = false;

  List<Booking> _allBookings = [];
  List<Booking> _activeBookings = [];
  List<Booking> _completedBookings = [];
  List<Booking> _cancelBookings = [];

  bool get isLoading => _isLoading;
  bool get isHistoryLoading => _isHistoryLoading;
  bool get isPagLoading => _isPagLoading;

  List<Booking> get allBookings => _allBookings;
  List<Booking> get activeBookings => _activeBookings;
  List<Booking> get completedBookings => _completedBookings;
  List<Booking> get cancelBookings => _cancelBookings;

  Future<void> createNewBooking(
      Users users,
      Room room,
      String checkInTime,
      String checkOutTime,
      double bookingPrice,
      List<String> selectedRooms) async {
    _isLoading = true;
    notifyListeners();

    Booking newBooking = Booking(
      guestId: users.uid!,
      roomId: room.rid!,
      typeRoom: room.type,
      roomName: selectedRooms,
      checkIn: DateTime.parse(checkInTime),
      checkOut: DateTime.parse(checkOutTime),
      bookingPrice: bookingPrice,
    );

    await _bookingService.createNewBooking(newBooking);

    await _roomService.updateRoomAvailability(room.rid!, selectedRooms);

    _isLoading = false;
    notifyListeners();
  }

  //all booking
  Future<void> getBookingByUid(String uid) async {
    _isHistoryLoading = true;
    notifyListeners();

    _allBookings = await _bookingService.getBookingByUid(uid);
    getActiveBooking();

    _isHistoryLoading = false;
    notifyListeners();
  }

  void checkForCheckOut(Booking booking) async {
    if (booking.status == ConfigKey.active) {
      bool checkUpdated = await _bookingService.updateBooking(
          booking.bid ?? "error", ConfigKey.status, ConfigKey.completed);

      if (checkUpdated) {
        _activeBookings.remove(booking);

        _completedBookings.insert(0, booking);
        notifyListeners();
      }

      notifyListeners();
    }
  }

  Future<void> getActiveBooking() async {
    _isPagLoading = true;
    notifyListeners();

    _allBookings.forEach((book) {
      if (book.status == ConfigKey.active) {
        _activeBookings.insert(0, book);
      } else if (book.status == ConfigKey.completed) {
        _completedBookings.insert(0, book);
      } else {
        _cancelBookings.insert(0, book);
      }
    });

    _isPagLoading = false;
    notifyListeners();
  }
}
