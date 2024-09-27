import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/room.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/views/widgets/bottom_sheet/room_selection_bottom_sheet.dart.dart';
import 'package:hotel_booking_app/views/widgets/button/w120_h50_button.dart';
import 'package:hotel_booking_app/views/widgets/card/replace_error_image_card.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HotelUtilitiesCard extends StatelessWidget {
  final Room room;
  HotelUtilitiesCard({super.key, required this.room});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    final List<String> utilities = room.utilities;
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CachedNetworkImage(
              imageUrl: room.image[0],
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => ReplaceErrorImageCard(
                    height: 190,
                    width: 380,
                  ),
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 190,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                room.type,
                style: myTheme.textTheme.bodyLarge,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: utilities.take(5).map((utility) {
                  return ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.minimumDensity),
                    leading: Icon(ConfigKey.iconMap[utility] ??
                        ConfigKey.iconMap[ConfigKey.error]),
                    title: Text(
                      utility,
                      style: myTheme.textTheme.bodySmall,
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "${room.roomPrice}VND",
                        style: myTheme.textTheme.labelLarge,
                      ),
                      subtitle: Text(
                        "1 night",
                        style: myTheme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  W120H50Button(
                    labelButton: "Select",
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => RoomSelectionBottomSheet(
                          room: room,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ]));
  }
}
