import 'package:flutter/material.dart';

class HotelCategoryCard extends StatelessWidget {
  HotelCategoryCard({super.key});
  late var mediaQuery;
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    myTheme = Theme.of(context);
    return Container(
      width: mediaQuery.width / 3,
      height: 30,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1.0, color: Colors.grey.shade400),
        color: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular",
            style: myTheme.textTheme.labelMedium,
          ),
          Icon(
            Icons.bedroom_parent_outlined,
            color: Colors.blue.shade900,
          ),
        ],
      ),
    );
  }
}
