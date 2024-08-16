import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_information_column_card.dart';

class HotelListScreen extends StatefulWidget {
  const HotelListScreen({super.key});

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text("Home Detail"),
          backgroundColor: Colors.blue.shade400,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return HotelInformationColumnCard();
          },
        ));
  }
}
