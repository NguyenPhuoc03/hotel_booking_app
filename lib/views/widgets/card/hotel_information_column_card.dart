import 'package:flutter/material.dart';

class HotelInformationColumnCard extends StatefulWidget {
  HotelInformationColumnCard({super.key});

  @override
  State<HotelInformationColumnCard> createState() => _HotelInformationColumnCardState();
}

class _HotelInformationColumnCardState extends State<HotelInformationColumnCard> {
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'hotelDetail');
        print("near you");
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXWH_Uk5GhUcs_IXcOtmVodFFYSDVF-blVVw&s',
                      ))),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      width: 50,
                      height: 50,
                      child: IconButton(
                        icon: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.favorite_border_outlined),
                        ),
                        onPressed: () {},
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Beach Resort Lux",
                        style: myTheme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue.shade700),
                      ),
                      Text(
                        'Quy Nhon',
                        style: myTheme.textTheme.displayMedium
                            ?.copyWith(color: Colors.blue.shade600),
                      ),
                    ],
                  ),
                  Text(
                    '\$750',
                    style: myTheme.textTheme.bodyLarge
                        ?.copyWith(color: Colors.red),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
