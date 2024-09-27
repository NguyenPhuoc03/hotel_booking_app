import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/room_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/card/replace_error_image_card.dart';
import 'package:provider/provider.dart';

class HotelInformationColumnCard extends StatefulWidget {
  HotelInformationColumnCard({super.key, required this.hotel});
  final Hotel hotel;

  @override
  State<HotelInformationColumnCard> createState() =>
      _HotelInformationColumnCardState();
}

class _HotelInformationColumnCardState
    extends State<HotelInformationColumnCard> {
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return GestureDetector(
      //onTap: widget.onTap,
      onTap: () async {
        await context.read<RoomViewmodel>().getRooms(widget.hotel.hid!);
        Navigator.pushNamed(
          context,
          'hotelDetail',
          arguments: {
            ConfigKey.room: widget.hotel.hid,
            ConfigKey.name: widget.hotel.name,
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: widget.hotel.image[0],
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => ReplaceErrorImageCard(
                      height: 200,
                      width: double.infinity,
                    ),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageProvider,
                        )),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            right: 0,
                            width: 50,
                            height: 50,
                            child: IconButton(
                              icon: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(Icons.favorite_border_outlined),
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                  );
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hotel.name,
                        style: myTheme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue.shade700),
                      ),
                      Text(
                        widget.hotel.address[ConfigKey.district].toString(),
                        style: myTheme.textTheme.displayMedium
                            ?.copyWith(color: Colors.blue.shade600),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.hotel.lowestRoomPrice}VND',
                    style: myTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.red, fontSize: 22),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
