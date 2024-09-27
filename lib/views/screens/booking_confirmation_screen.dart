import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/booking_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/button/confirm_button.dart';
import 'package:hotel_booking_app/views/widgets/button/w120_h50_button.dart';
import 'package:hotel_booking_app/views/widgets/card/information_booking_card.dart';
import 'package:provider/provider.dart';

class BookingConfirmationScreen extends StatelessWidget {
  BookingConfirmationScreen({super.key});

  late Room room;
  late int numberOfRooms;
  late String checkInTime;
  late String checkOutTime;
  late Map<String, dynamic> arguments;
  late int priceOfRoom;
  late List<String> selectedRooms;

  @override
  Widget build(BuildContext context) {
    UserViewmodel userViewmodel = Provider.of<UserViewmodel>(context);
    BookingViewmodel bookingViewmodel = Provider.of<BookingViewmodel>(context);
    final mediaQuery = MediaQuery.of(context);
    final myTheme = Theme.of(context);
    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    room = arguments[ConfigKey.room];
    numberOfRooms = arguments[ConfigKey.numberOfRooms];
    checkInTime = arguments[ConfigKey.checkInTime];
    checkOutTime = arguments[ConfigKey.checkOutTime];
    priceOfRoom = room.roomPrice;
    selectedRooms = arguments[ConfigKey.selectedRooms];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text("Booking Confirmation"),
      ),
      body: Column(
        children: [
          InformationBookingCard(
            icon: const Icon(Icons.account_circle),
            title: "Information",
            body1: userViewmodel.user!.fullName,
            body2: userViewmodel.user!.email,
            body3: userViewmodel.user!.phoneNumber.isNotEmpty
                ? userViewmodel.user!.phoneNumber
                : 'Phone number not updated',
          ),
          InformationBookingCard(
            icon: const Icon(Icons.account_circle),
            title: room.type,
            body1: "Number of Rooms: $numberOfRooms",
            body2: "Check-in Time: $checkInTime",
            body3: "Check-out Time: $checkOutTime",
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 3, color: Colors.grey.shade200)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total: "),
                FutureBuilder<double>(
                    future: _totalCalculation(
                        checkInTime, checkOutTime, numberOfRooms, priceOfRoom),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return const Text("0VND");
                      } else {
                        return Text("${snapshot.data}VND");
                      }
                    }),
              ],
            ),
          ),
          ConfirmButton(
            onPressed: () async {
              double totalPrice = await _totalCalculation(
                  checkInTime, checkOutTime, numberOfRooms, priceOfRoom);
              await bookingViewmodel.createNewBooking(
                userViewmodel.user!,
                room,
                checkInTime,
                checkOutTime,
                totalPrice,
                selectedRooms,
              );

              Navigator.pop(context);
            },
            labelButton: 'Confirm Booking',
          ),
        ],
      ),
    );
  }

  Future<double> _totalCalculation(String checkInTime, String checkOutTime,
      int numberOfRooms, int priceOfRoom) async {
    DateTime checkInDateTime = DateTime.parse(checkInTime);
    DateTime checkOutDateTime = DateTime.parse(checkOutTime);

    //tinh khoang cach thoi gian
    Duration difference = checkOutDateTime.difference(checkInDateTime);

    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    if (minutes > 0) {
      hours++;
    }

    double price =
        ((hours ~/ 20) + (hours % 20) * 0.06) * numberOfRooms * priceOfRoom;

    return price;
  }
}
