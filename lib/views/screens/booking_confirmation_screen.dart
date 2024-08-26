import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card/information_booking_card.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final myTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
      ),
      body: Column(
        children: [
          InformationBookingCard(
            icon: Icon(Icons.account_circle),
            title: "Information",
            body1: "Nguyễn Huỳnh Phước",
            body2: "email@gmail.com",
            body3: "0358994502",
          ),
          InformationBookingCard(
            icon: Icon(Icons.account_circle),
            title: "New house",
            body1: "Number of Rooms: 3",
            body2: "Check-in Time: 27/12/2003 23:00",
            body3: "Check-out Time: 27/12/2003 23:00",
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 3, color: Colors.grey.shade200)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: "),
                Text("\$ 1000"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade400,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Confirm Booking',
              style: myTheme.textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
