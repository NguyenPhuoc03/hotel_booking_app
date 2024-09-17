import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/views/widgets/card/replace_error_image_card.dart';

class HotelInformationStackCard extends StatelessWidget {
  final Function onTap;
  final Hotel hotel;
  HotelInformationStackCard(
      {super.key, required this.onTap, required this.hotel});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: CachedNetworkImage(
        imageUrl: hotel.image[0],
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => ReplaceErrorImageCard(
          height: 185,
          widght: 270,
        ),
        imageBuilder: (context, imageProvider) {
          return Container(
              height: 185,
              width: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotel.name,
                          style: myTheme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          hotel.address[ConfigKey.province]!,
                          style: myTheme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Row(
                      children: [
                        Text(
                          hotel.avgRating.toString(),
                          style: myTheme.textTheme.titleSmall,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
