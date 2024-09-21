import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/utils/config_list.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_category_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, '/searchNextStep'),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(45)),
                              border:
                                  Border.all(width: 1.0, color: Colors.blue),
                              color: Colors.grey.shade300,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                SizedBox(
                                  width: 12,
                                ),
                                Text("Search..."),
                              ],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            // setState(() {
                            //   showModalBottomSheet(
                            //       shape: const RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.vertical(
                            //           top: Radius.circular(25),
                            //         ),
                            //       ),
                            //       clipBehavior: Clip.antiAliasWithSaveLayer,
                            //       context: context,
                            //       builder: (context) =>
                            //           _custombottomSheetFilter(context));
                            // }
                            // );
                          },
                          icon: const Icon(
                            Icons.filter_list,
                            size: 30,
                          )),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("Recommended for you"),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: ConfigList.hotelTypes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      mainAxisExtent: 50.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return HotelCategoryCard(
                        name: ConfigList.hotelTypes[index][ConfigKey.type],
                        icon: ConfigList.hotelTypes[index][ConfigKey.icon],
                        onTap: () {
                          print("ontap");
                          Navigator.pushNamed(
                            context,
                            '/hotelList',
                            arguments: {
                              ConfigKey.type: ConfigList.hotelTypes[index]
                                  [ConfigKey.type],
                            },
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
