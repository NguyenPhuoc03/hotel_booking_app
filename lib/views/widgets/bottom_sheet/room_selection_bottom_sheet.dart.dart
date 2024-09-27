import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/room_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/button/min_h60_button.dart';
import 'package:provider/provider.dart';

class RoomSelectionBottomSheet extends StatefulWidget {
  final Room room;
  RoomSelectionBottomSheet({super.key, required this.room});
  late ThemeData myTheme;

  @override
  State<RoomSelectionBottomSheet> createState() =>
      _RoomSelectionBottomSheetState();
}

class _RoomSelectionBottomSheetState extends State<RoomSelectionBottomSheet> {
  final TextEditingController _controllerCheckInTime = TextEditingController();
  final TextEditingController _controllerCheckOutTime = TextEditingController();
  late int _numberOfRoom;
  bool _isButtonDisable = true;
  List<String> availableRooms = [];

  @override
  void initState() {
    super.initState();
    _numberOfRoom = 1;
    _controllerCheckInTime.addListener(_checkConditions);
    _controllerCheckOutTime.addListener(_checkConditions);
    _getAvailableRooms();
  }

  Future<void> _getAvailableRooms() async {
    availableRooms =
        await context.read<RoomViewmodel>().getAvailableRooms(widget.room.rid);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controllerCheckInTime.dispose();
    _controllerCheckOutTime.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final myTheme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
      )),
      height: mediaQuery.size.height * 0.45,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            title: Align(
              alignment: Alignment.center,
              child: Text(widget.room.type),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: _isButtonDisable
                    ? const Icon(
                        Icons.error,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.check,
                        color: Colors.blue.shade400,
                      )),
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
                  IconButton(
                      onPressed: _decreaseNumberOfRooms,
                      icon: const Icon(Icons.remove)),
                  Container(
                    alignment: Alignment.center,
                    width: 45,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Text(
                      _numberOfRoom.toString(),
                      style: myTheme.textTheme.headlineSmall
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  IconButton(
                      onPressed: _increaseNumberOfRooms,
                      icon: const Icon(Icons.add)),
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
                ),
              ),
            ],
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              "Cost:",
              style: myTheme.textTheme.headlineSmall
                  ?.copyWith(color: Colors.black),
            ),
            trailing: Text("${widget.room.roomPrice}VND/night ",
                style:
                    myTheme.textTheme.titleLarge?.copyWith(color: Colors.red)),
          ),
          MinH60Button(
            onPressed: _isButtonDisable
                ? null
                : () {
                    List<String> selectedRooms =
                        availableRooms.take(_numberOfRoom).toList();
                    Navigator.pushNamed(context, 'bookingConfirmation',
                        arguments: <String, dynamic>{
                          ConfigKey.room: widget.room,
                          ConfigKey.numberOfRooms: _numberOfRoom,
                          ConfigKey.checkInTime: _controllerCheckInTime.text,
                          ConfigKey.checkOutTime: _controllerCheckOutTime.text,
                          ConfigKey.selectedRooms: selectedRooms,
                        });
                  },
            labelButton: "Booking",
          ),
        ],
      ),
    );
  }

  void _increaseNumberOfRooms() {
    if (_numberOfRoom < availableRooms.length) {
      setState(() {
        _numberOfRoom++;
      });
    }
  }

  void _decreaseNumberOfRooms() {
    if (_numberOfRoom > 1) {
      setState(() {
        _numberOfRoom--;
      });
    }
  }

  void _checkConditions() {
    String checkInTime = _controllerCheckInTime.text;
    String checkOutTime = _controllerCheckOutTime.text;

    setState(() {
      if (checkInTime.isEmpty || checkOutTime.isEmpty) {
        _isButtonDisable = true;
      } else {
        DateTime checkInDateTime = DateTime.parse(checkInTime);
        DateTime checkOutDateTime = DateTime.parse(checkOutTime);
        if (checkInDateTime.isAfter(checkOutDateTime)) {
          _isButtonDisable = true;
        } else {
          _isButtonDisable = false;
        }
      }
    });
  }
}
