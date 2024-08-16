import 'package:flutter/material.dart';

class HotelInformationStackCard extends StatelessWidget {
  final Function onTap;
  HotelInformationStackCard({super.key, required this.onTap});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          height: 185,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXWH_Uk5GhUcs_IXcOtmVodFFYSDVF-blVVw&s'),
              fit: BoxFit.cover,
            )
          ),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lux Hotel with a Pool',
                      style: myTheme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Dubai',
                      style: myTheme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Positioned(
                bottom: 10,
                right: 15,
                child: Row(
                  children: [
                    Text(
                      '\$700',
                      style: myTheme.textTheme.titleSmall,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '4.5',
                      style: myTheme.textTheme.titleSmall,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
