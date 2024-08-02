import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card_hotel_detail.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key});

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Detail"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => CardHotelDetail(),
        ),
    );
  }
}
