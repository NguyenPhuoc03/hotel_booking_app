import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hotel_booking_app/models/booking.dart';
import 'package:hotel_booking_app/models/review.dart';
import 'package:hotel_booking_app/services/review_services.dart';
import 'package:hotel_booking_app/viewmodels/hotel_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/room_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';

class ReviewViewmodel extends ChangeNotifier {
  final ReviewServices _reviewServices = ReviewServices();
  final UserViewmodel _userViewmodel = UserViewmodel();
  final HotelViewmodel _hotelViewmodel = HotelViewmodel();
  final RoomViewmodel _roomViewmodel = RoomViewmodel();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> createNewReview(
    Booking booking,
    double star,
  ) async {
    _isLoading = true;
    notifyListeners();

    final room = await _roomViewmodel.getRoomById(booking.roomId);
    final hotel = await _hotelViewmodel.getHotelById(room!.hotelId);

    Review review = Review(
      guestId: _userViewmodel.user!.uid!,
      hotelId: hotel!.hid!,
      bookingId: booking.bid!,
      star: star,
      createAt: DateTime.now(),
    );

    await _reviewServices.createNewReview(review);

    _isLoading = false;
    notifyListeners();
  }
}
