import 'package:flutter/material.dart';

class EmptyBookingTabBarView extends StatelessWidget {
  EmptyBookingTabBarView({super.key});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_late_sharp,
            color: Colors.blueGrey,
            size: 90,
          ),
          Text(
            "No current bookings",
            style: myTheme.textTheme.displayMedium
                ?.copyWith(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
