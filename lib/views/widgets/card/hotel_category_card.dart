import 'package:flutter/material.dart';
import 'package:text_marquee/text_marquee.dart';

class HotelCategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  HotelCategoryCard(
      {super.key, required this.onTap, required this.name, required this.icon});
  final VoidCallback onTap;
  late var mediaQuery;
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context).size;
    myTheme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: mediaQuery.width / 3,
        height: 30,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1.0, color: Colors.grey.shade400),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: mediaQuery.width / 3,
              child: TextMarquee(
                name,
                style: myTheme.textTheme.labelMedium!,
                duration: const Duration(seconds: 5),
                delay: const Duration(seconds: 5),
              ),
            ),
            Icon(
              icon,
              color: Colors.blue.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
