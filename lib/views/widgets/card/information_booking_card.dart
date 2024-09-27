import 'package:flutter/material.dart';

class InformationBookingCard extends StatelessWidget {
  InformationBookingCard({
    super.key,
    this.icon,
    this.body1,
    this.body2,
    this.body3,
    this.title,
  });
  final Icon? icon;
  final String? title;
  final String? body1;
  final String? body2;
  final String? body3;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final myTheme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      width: mediaQuery.size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 3, color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.all(0),
            leading: icon,
            title: Text(title ?? "Error", style: myTheme.textTheme.bodyLarge),
          ),
          Text(
            body1 ?? "Error",
            style: myTheme.textTheme.displayMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            body2 ?? "Error",
            style: myTheme.textTheme.displayMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            body3 ?? "Error",
            style: myTheme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
