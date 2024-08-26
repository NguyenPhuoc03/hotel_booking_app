import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/tab_bar_view/active_booking_tab_bar_view.dart';
import 'package:hotel_booking_app/views/widgets/tab_bar_view/canceled_booking_tab_bar_view.dart';
import 'package:hotel_booking_app/views/widgets/tab_bar_view/completed_booking_tab_bar_view.dart';
import 'package:hotel_booking_app/views/widgets/tab_bar_view/empty_booking_tab_bar_view.dart';

class BookingHistoryScreen extends StatefulWidget {
  BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  late ThemeData myTheme;
  bool isEmptyActiveBooking = false;
  bool isEmptyComletedBooking = true;
  bool isEmptyCanceledBooking = false;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue.shade400,
          title: const Text("Booking History"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                labelColor: Colors.blue.shade700,
                labelStyle: myTheme.textTheme.labelMedium,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: myTheme.textTheme.labelMedium,
                tabs: const [
                  Text('Active'),
                  Text('Completed'),
                  Text('Canceled'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            isEmptyActiveBooking
                ? EmptyBookingTabBarView()
                : ActiveBookingTabBarView(),
            isEmptyComletedBooking
                ? EmptyBookingTabBarView()
                : CompletedBookingTabBarView(),
            isEmptyCanceledBooking
                ? EmptyBookingTabBarView()
                : CanceledBookingTabBarView(),
          ],
        ),
      ),
    );
  }
}
