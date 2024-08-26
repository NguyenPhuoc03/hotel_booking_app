import 'package:flutter/material.dart';

class SearchResultHotelCard extends StatelessWidget {
  SearchResultHotelCard({super.key});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "FLC Resort",
                style: myTheme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5,),
              Text(
                "Quy Nhon",
                style: myTheme.textTheme.displayMedium
                    ?.copyWith(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text(
                    "4.5",
                    style: myTheme.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 16,),
                  Icon(
                    Icons.panorama_wide_angle_select,
                    size: 4,
                  ),
                  SizedBox(width: 16,),
                  Text(
                    "300 reviews",
                    style: myTheme.textTheme.bodySmall,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
