import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/viewmodels/booking_view_model.dart';
import 'package:provider/provider.dart';

class RoomSelectionBottomSheet extends StatefulWidget {
  RoomSelectionBottomSheet({super.key});
  late ThemeData myTheme;

  @override
  State<RoomSelectionBottomSheet> createState() =>
      _RoomSelectionBottomSheetState();
}

class _RoomSelectionBottomSheetState extends State<RoomSelectionBottomSheet> {
  final TextEditingController _controllerCheckInTime = TextEditingController();
  final TextEditingController _controllerCheckOutTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final myTheme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
      )),
      height: mediaQuery.size.height * 0.45,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            title: Align(
              alignment: Alignment.center,
              child: Text("Royal Hotel"),
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.error)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Number of Rooms",
                style: myTheme.textTheme.headlineSmall
                    ?.copyWith(color: Colors.black),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                  Container(
                    alignment: Alignment.center,
                    width: 45,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Text(
                      "200",
                      style: myTheme.textTheme.headlineSmall
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Check-in Time",
                style: myTheme.textTheme.headlineSmall
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(
                width: mediaQuery.size.width / 2,
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  controller: _controllerCheckInTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateHintText: 'd MMM, yyyy',
                  timeHintText: 'HH:mm',
                  textAlign: TextAlign.center,
                  style: myTheme.textTheme.bodyMedium,
                  timeFieldWidth: mediaQuery.size.width / 6,
                  // selectableDayPredicate: (date) {
                  //   if (date.weekday == 6 || date.weekday == 7) {
                  //     return false;
                  //   }
                  //   return true;
                  // },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Check-out Time",
                style: myTheme.textTheme.headlineSmall
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(
                width: mediaQuery.size.width / 2,
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  controller: _controllerCheckOutTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  dateHintText: 'd MMM, yyyy',
                  timeHintText: 'HH:mm',
                  textAlign: TextAlign.center,
                  style: myTheme.textTheme.bodyMedium,
                  timeFieldWidth: mediaQuery.size.width / 6,
                  // selectableDayPredicate: (date) {
                  //   if (date.weekday == 6 || date.weekday == 7) {
                  //     return false;
                  //   }
                  //   return true;
                  // },
                ),
              ),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              "Cost:",
              style: myTheme.textTheme.headlineSmall
                  ?.copyWith(color: Colors.black),
            ),
            trailing: Text("\$ 1000 / night ",
                style:
                    myTheme.textTheme.titleLarge?.copyWith(color: Colors.red)),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: Size(3 * mediaQuery.size.width / 4, 60),
              ),
              child: Text(
                "Booking",
                style: myTheme.textTheme.titleLarge?.copyWith(
                  letterSpacing: 1.25,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ],
      ),
    );
  }
}
