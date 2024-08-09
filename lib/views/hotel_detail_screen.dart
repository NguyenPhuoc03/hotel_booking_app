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
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Home Detail"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => CardHotelDetail(),
        ),
    );
  }
}
