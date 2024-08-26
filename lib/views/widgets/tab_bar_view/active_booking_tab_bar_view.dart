import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card/booking_status_card.dart';

class ActiveBookingTabBarView extends StatefulWidget {
  const ActiveBookingTabBarView({super.key});

  @override
  State<ActiveBookingTabBarView> createState() =>
      _ActiveBookingTabBarViewState();
}

class _ActiveBookingTabBarViewState extends State<ActiveBookingTabBarView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, item) {
          return BookingStatusCard(labelButton: "Check-out");
        });
  }
}
