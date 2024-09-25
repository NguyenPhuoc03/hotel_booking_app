import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/views/widgets/card/replace_error_image_card.dart';

class SearchResultHotelCard extends StatelessWidget {
  final Hotel hotel;
  SearchResultHotelCard({super.key, required this.hotel});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return GestureDetector(
      onTap: () {},
      child: CachedNetworkImage(
        imageUrl: hotel.image[0],
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => ReplaceErrorImageCard(
          height: 100.0,
          width: 100.0,
        ),
        imageBuilder: (context, imageProvider) {
          return Card(
            color: Colors.transparent,
            elevation: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      hotel.name,
                      style: myTheme.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      hotel.address[ConfigKey.province] ?? "Error",
                      style: myTheme.textTheme.displayMedium
                          ?.copyWith(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          hotel.avgRating.toString(),
                          style: myTheme.textTheme.bodySmall,
                        ),
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.yellow,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.panorama_wide_angle_select,
                            size: 4,
                          ),
                        ),
                        Text(
                          hotel.totalReview.toString(),
                          style: myTheme.textTheme.bodySmall,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
