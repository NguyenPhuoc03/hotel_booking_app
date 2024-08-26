import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card/booking_status_card.dart';

class CanceledBookingTabBarView extends StatefulWidget {
  const CanceledBookingTabBarView({super.key});

  @override
  State<CanceledBookingTabBarView> createState() => _CanceledBookingTabBarViewState();
}

class _CanceledBookingTabBarViewState extends State<CanceledBookingTabBarView> {
  @override
  Widget build(BuildContext context) {
     return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, item) {
          return BookingStatusCard(labelButton: "Rebook");
        });
  }
}