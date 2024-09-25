import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/views/widgets/card/replace_error_image_card.dart';

class HotelDealCard extends StatelessWidget {
  final Function onTap;
  final Hotel hotel;
  HotelDealCard({super.key, required this.onTap, required this.hotel});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Badge(
        label: Text("-${hotel.discount}%"),
        offset: Offset(-18, 11),
        largeSize: 30,
        smallSize: 0,
        child: CachedNetworkImage(
            imageUrl: hotel.image[0],
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => ReplaceErrorImageCard(
                  height: 120,
                  width: 200,
                ),
            imageBuilder: (context, imageProvider) {
              return Container(
                  height: 120,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 15,
                        child: Text(
                          hotel.name,
                          style: myTheme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
