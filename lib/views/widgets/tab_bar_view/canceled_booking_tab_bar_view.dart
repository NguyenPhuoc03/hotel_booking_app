import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/booking.dart';
import 'package:hotel_booking_app/views/widgets/card/booking_status_card.dart';

class CanceledBookingTabBarView extends StatefulWidget {
  const CanceledBookingTabBarView({super.key, required this.cancelBookings});
  final List<Booking> cancelBookings;

  @override
  State<CanceledBookingTabBarView> createState() => _CanceledBookingTabBarViewState();
}

class _CanceledBookingTabBarViewState extends State<CanceledBookingTabBarView> {
  @override
  Widget build(BuildContext context) {
     return ListView.builder(
        itemCount: widget.cancelBookings.length,
        itemBuilder: (context, item) {
          final booking = widget.cancelBookings[item];
          return BookingStatusCard(labelButton: "Rebook", booking: booking, onPressed: () {  },);
        });
  }
}