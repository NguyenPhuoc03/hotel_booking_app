import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card/booking_status_card.dart';

class CompletedBookingTabBarView extends StatefulWidget {
  const CompletedBookingTabBarView({super.key});

  @override
  State<CompletedBookingTabBarView> createState() =>
      _CompletedBookingTabBarViewState();
}

class _CompletedBookingTabBarViewState
    extends State<CompletedBookingTabBarView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, item) {
          return BookingStatusCard(labelButton: "Review");
        });
  }
}
