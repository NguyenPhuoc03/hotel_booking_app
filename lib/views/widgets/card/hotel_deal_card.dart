import 'package:flutter/material.dart';

class HotelDealCard extends StatelessWidget {
  final Function onTap;
  HotelDealCard({super.key, required this.onTap});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Badge(
        label: Text("-75%"),
        offset: Offset(-18, 11),
        largeSize: 30,
        smallSize: 0,
        child: Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXWH_Uk5GhUcs_IXcOtmVodFFYSDVF-blVVw&s'),
                  fit: BoxFit.cover,
                )),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  left: 15,
                  child: Text(
                    'Lux Hotel with a Pool ah foahf oahf oahfoaf',
                    style: myTheme.textTheme.titleMedium,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
