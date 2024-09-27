import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/booking.dart';
import 'package:hotel_booking_app/views/widgets/card/booking_status_card.dart';

class ActiveBookingTabBarView extends StatefulWidget {
  ActiveBookingTabBarView(
      {super.key, required this.activeBookings, required this.onPressed});
  final List<Booking> activeBookings;
  final Function(Booking) onPressed;

  @override
  State<ActiveBookingTabBarView> createState() =>
      _ActiveBookingTabBarViewState();
}

class _ActiveBookingTabBarViewState extends State<ActiveBookingTabBarView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.activeBookings.length,
        itemBuilder: (context, item) {
          final booking = widget.activeBookings[item];
          return BookingStatusCard(
            labelButton: "Check-out",
            booking: booking,
            onPressed: () => widget.onPressed(booking),
          );
        });
  }
}
