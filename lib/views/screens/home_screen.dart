//import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/sightseeing_spot_model.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/hotel_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/room_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_deal_card.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_information_column_card.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_information_stack_card.dart';
import 'package:hotel_booking_app/views/widgets/other/custom_banner_container.dart';

import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

final List<SightseeingSpot> imgList = [
  SightseeingSpot(
      name: "HaNoi",
      location: "location",
      url:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      description: "description",
      yearBuilt: 2000),
  SightseeingSpot(
      name: "HaNoi",
      location: "location",
      url:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      description: "description",
      yearBuilt: 2000),
  SightseeingSpot(
      name: "HaNoi",
      location: "location",
      url:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      description: "description",
      yearBuilt: 2000),
  SightseeingSpot(
      name: "HaNoi",
      location: "location",
      url:
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      description: "description",
      yearBuilt: 2000),
  SightseeingSpot(
      name: "HaNoi",
      location: "location",
      url:
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      description: "description",
      yearBuilt: 2000),
  SightseeingSpot(
      name: "HaNoi",
      location: "location",
      url:
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      description: "description",
      yearBuilt: 2000),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<Widget> imageSliders = imgList
    .map(
      (item) => CustomBannerContainer(item),
    )
    .toList();

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData myTheme;
  late bool isEmptyNearYouHotel;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    isEmptyNearYouHotel = false;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          toolbarHeight: 80.0,
          title: Consumer<UserViewmodel>(
            builder:
                (BuildContext context, UserViewmodel value, Widget? child) {
              return ListTile(
                leading: ClipOval(
                  child: CachedNetworkImage(
                    height: 50,
                    width: 50,
                    imageUrl: value.user!.avatar,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.asset('images/avatar.jpg'),
                  ),
                ),
                title: const Text(
                  "Welcome back",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: Text(
                  value.user?.fullName ?? "Unknown",
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
          ),
          actions: [
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: 12, end: 8),
              //showBadge: false,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notification');
                },
                icon: Icon(Icons.notifications, size: 32),
              ),
            )
          ],
          backgroundColor: Colors.grey.shade50,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            //banner
            // Container(
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       autoPlay: true,
            //       aspectRatio: 16 / 9,
            //       enlargeCenterPage: true,
            //       viewportFraction: 1.0,
            //     ),
            //     items: imageSliders,
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            //list item
            //popular hotels
            Container(
              height: 270,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Hotels",
                          style: myTheme.textTheme.labelLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/hotelList',
                              arguments: {
                                ConfigKey.type: ConfigKey.popularHotels
                              },
                            );
                          },
                          child: Text(
                            "See all",
                            style: myTheme.textTheme.labelSmall,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<HotelViewmodel>(
                      builder: (BuildContext context, HotelViewmodel value,
                          Widget? child) {
                        if (value.isPopularLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (value.popularHotels.isEmpty) {
                          return const Text('Error');
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.popularHotels.length,
                          itemBuilder: (context, index) {
                            final popularHotel = value.popularHotels[index];
                            return HotelInformationStackCard(
                              onTap: () async {
                                await context
                                    .read<RoomViewmodel>()
                                    .getRooms(popularHotel.hid!);
                                Navigator.pushNamed(
                                  context,
                                  'hotelDetail',
                                  arguments: {
                                    ConfigKey.room: popularHotel.hid,
                                    ConfigKey.name: popularHotel.name,
                                  },
                                );
                              },
                              hotel: popularHotel,
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            //deals
            Container(
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deals",
                          style: myTheme.textTheme.labelLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/hotelList',
                              arguments: {ConfigKey.type: ConfigKey.dealHotels},
                            );
                          },
                          child: Text(
                            "See all",
                            style: myTheme.textTheme.labelSmall,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<HotelViewmodel>(
                      builder: (BuildContext context, HotelViewmodel value,
                          Widget? child) {
                        if (value.isDealLoading) {
                          return const CircularProgressIndicator();
                        } else if (value.dealHotels.isEmpty) {
                          return const Text('Error');
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.dealHotels.length,
                          itemBuilder: (context, index) {
                            final dealHotel = value.dealHotels[index];
                            return HotelDealCard(
                              onTap: () async {
                                await context
                                    .read<RoomViewmodel>()
                                    .getRooms(dealHotel.hid!);
                                Navigator.pushNamed(
                                  context,
                                  'hotelDetail',
                                  arguments: {
                                    ConfigKey.room: dealHotel.hid,
                                    ConfigKey.name: dealHotel.name,
                                  },
                                );
                              },
                              hotel: dealHotel,
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            // near you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Near You",
                    style: myTheme.textTheme.labelLarge,
                  ),
                  Consumer<HotelViewmodel>(builder: (BuildContext context,
                      HotelViewmodel value, Widget? child) {
                    isEmptyNearYouHotel = value.nearYouHotels.isEmpty;
                    return IconButton(
                      onPressed: isEmptyNearYouHotel
                          ? null
                          : () {
                              Navigator.pushNamed(
                                context,
                                '/hotelList',
                                arguments: {
                                  ConfigKey.type: ConfigKey.nearYouHotels
                                },
                              );
                            },
                      icon: isEmptyNearYouHotel
                          ? const Icon(
                              Icons.east,
                              color: Colors.grey,
                            )
                          : Icon(
                              Icons.east,
                              color: Colors.blue.shade900,
                            ),
                    );
                  }),
                ],
              ),
            ),
            Consumer<HotelViewmodel>(
              builder:
                  (BuildContext context, HotelViewmodel value, Widget? child) {
                if (value.isNearYouLoading) {
                  return const CircularProgressIndicator();
                } else if (value.nearYouHotels.isEmpty) {
                  isEmptyNearYouHotel = true;
                  return const Text('No hotels available');
                }
                isEmptyNearYouHotel = false;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.nearYouHotels.length,
                  itemBuilder: (context, index) {
                    final nearYouHotel = value.nearYouHotels[index];
                    return HotelInformationColumnCard(
                      hotel: nearYouHotel,
                    );
                  },
                );
              },
            ),
          ]),
        ));
  }
}
