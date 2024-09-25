import 'package:flutter/material.dart';

class ReplaceErrorImageCard extends StatelessWidget {
  final double height;
  final double width;
  ReplaceErrorImageCard(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blue.shade100),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: const Icon(Icons.error),
    );
  }
}
