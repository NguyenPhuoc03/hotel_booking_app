import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/card/hotel_category_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
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

                        //     CustomTextFormFieldSearch(
                        //   hint: "Search...",
                        //   prefixIcon: Icons.search,
                        //   controller: _searchController,
                        //   filled: true,
                        //   suffixIcon: _searchController.text.isEmpty
                        //       ? null
                        //       : Icons.cancel,
                        //   onTapSuffixIcon: () {
                        //     _searchController.clear();
                        //   },
                        //   onChanged: (pure) {
                        //     setState(() {});
                        //   },
                        //   onEditingComplete: () {},
                        // ),
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
              SizedBox(
                height: 8,
              ),
              Text("Recommended for you"),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      mainAxisExtent: 50.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return HotelCategoryCard();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
