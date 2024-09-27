import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/room_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_utilities_card.dart';
import 'package:provider/provider.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key});

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  late String hid;
  late String nameHotel;
  late final Map<String, dynamic> arguments;

  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      hid = arguments[ConfigKey.room];
      nameHotel = arguments[ConfigKey.name];
      isInitialized = true; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(nameHotel),
        backgroundColor: Colors.blue.shade400,
      ),
      body: FutureBuilder<List<Room>>(
          future: _getRooms(hid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching rooms'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No rooms available'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final room = snapshot.data![index];
                return HotelUtilitiesCard(room: room);
              },
            );
          }),
    );
  }

  Future<List<Room>> _getRooms(String hid) async {
    return context.read<RoomViewmodel>().rooms;
  }
}
