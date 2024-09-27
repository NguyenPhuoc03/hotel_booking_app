import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/hotel_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_information_column_card.dart';
import 'package:provider/provider.dart';

class HotelListScreen extends StatefulWidget {
  const HotelListScreen({super.key});

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  late String type;
  late final Map<String, dynamic> arguments;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Nhận arguments từ ModalRoute
    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    // arguments =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    type = arguments[ConfigKey.type];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(type),
        backgroundColor: Colors.blue.shade400,
      ),
      body: FutureBuilder<List<Hotel>>(
          future: _getHotelsBasedOnType(type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading hotels'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No hotels available'));
            } else {
              final hotels = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final hotel = hotels[index];
                  return HotelInformationColumnCard(
                    hotel: hotel,
                  );
                },
              );
            }
          }),
    );
  }

  Future<List<Hotel>> _getHotelsBasedOnType(String type) async {
    final viewmodel = Provider.of<HotelViewmodel>(context, listen: false);
    switch (type) {
      case ConfigKey.popularHotels:
        if (viewmodel.isPopularLoading) {
          await viewmodel.getPopularHotels();
        }
        return viewmodel.popularHotels;

      case ConfigKey.dealHotels:
        if (viewmodel.isDealLoading) {
          await viewmodel.getDealsHotels();
        }
        return viewmodel.dealHotels;

      case ConfigKey.nearYouHotels:
        if (viewmodel.isNearYouLoading) {
          await viewmodel.getNearYouHotels();
        }
        return viewmodel.nearYouHotels;

      default:
        return [];
    }
  }
}
