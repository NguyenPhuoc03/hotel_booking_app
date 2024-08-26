import 'package:flutter/material.dart';

class RecentSearchCard extends StatelessWidget {
  RecentSearchCard({super.key});
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: ListTile(
        visualDensity: VisualDensity(vertical: -4),
        contentPadding: EdgeInsets.all(0),
        leading: Icon(
          Icons.history_outlined,
          size: 28,
        ),
        title: Text(
          "Quy Nhon",
          style: myTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal),
        ),
        trailing: Icon(
          Icons.arrow_outward_sharp,
          size: 26,
        ),
      ),
    );
  }
}
