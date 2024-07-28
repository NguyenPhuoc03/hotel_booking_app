import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTabContainer extends StatelessWidget {
  String title;
  String subTitle;
  String imagePath;
  CustomTabContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          Image.asset(
            imagePath,
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: myTheme.textTheme.displayLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: myTheme.textTheme.displayMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
