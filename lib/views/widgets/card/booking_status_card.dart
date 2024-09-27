import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_app/models/booking.dart';

class BookingStatusCard extends StatefulWidget {
  BookingStatusCard(
      {super.key, required this.labelButton, required this.booking, required this.onPressed});
  Booking booking;
  VoidCallback onPressed;

  final String labelButton;

  @override
  State<BookingStatusCard> createState() => _BookingStatusCardState();
}

class _BookingStatusCardState extends State<BookingStatusCard> {
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(widget.booking.roomId,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: myTheme.textTheme.bodyLarge),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text("Số phòng: ${widget.booking.roomName.length}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Check-in"),
                  Text(
                      "${widget.booking.checkIn.hour}:${widget.booking.checkIn.minute}"),
                  Text(
                      "${widget.booking.checkIn.day}-${widget.booking.checkIn.month}-${widget.booking.checkIn.year}"),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Check-out"),
                  Text(
                      "${widget.booking.checkOut.hour}:${widget.booking.checkOut.minute}"),
                  Text(
                      "${widget.booking.checkOut.day}-${widget.booking.checkOut.month}-${widget.booking.checkOut.year}")
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${widget.booking.bookingPrice}VND",
                  style: myTheme.textTheme.labelLarge),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange.shade400,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(120, 50),
                ),
                child: Text(
                  widget.labelButton,
                  style: myTheme.textTheme.titleMedium?.copyWith(
                    letterSpacing: 1.25,
                  ),
                ),
                onPressed: widget.onPressed,
              )
            ],
          ),
        ],
      ),
    );
  }
}

