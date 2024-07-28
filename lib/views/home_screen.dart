import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking_app/models/sightseeing_spot_model.dart';
import 'package:hotel_booking_app/views/widgets/card_deals.dart';
import 'package:hotel_booking_app/views/widgets/card_popular_hotels.dart';
import 'package:hotel_booking_app/views/widgets/custom_banner_container.dart';

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
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        toolbarHeight: 80.0,
        title: const ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWVsm9smljjDm9Ta08_It5JxUFPKIO6ZPfbA&s'),
          ),
          title: Text(
            "Welcome back",
            style: TextStyle(fontSize: 22),
          ),
          subtitle: Text(
            "Nguyễn Huỳnh Phước",
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: 30),
          ),
        ],
        backgroundColor: Colors.grey.shade50,
      ),
      body: ListView(children: [
        //banner 
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
            ),
            items: imageSliders,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //list item
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
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: myTheme.textTheme.labelSmall,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CardPopularHotels(onTap: () {
                      print("test");
                    });
                  },
                ),
              )
            ],
          ),
        ),
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
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: myTheme.textTheme.labelSmall,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CardDeals(onTap: () {
                      print("test");
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
