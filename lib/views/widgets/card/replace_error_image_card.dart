import 'package:flutter/material.dart';

class ReplaceErrorImageCard extends StatelessWidget {
  final double height;
  final double widght;
  ReplaceErrorImageCard(
      {super.key, required this.height, required this.widght});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widght,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blue.shade100),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Icon(Icons.error),
    );
  }
}
