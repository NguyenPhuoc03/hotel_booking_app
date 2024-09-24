import 'package:flutter/material.dart';

class RecentSearchCard extends StatelessWidget {
  RecentSearchCard({super.key, required this.onTap, required this.label});
  final String label;
  final VoidCallback onTap;
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: ListTile(
        onTap: onTap,
        visualDensity: const VisualDensity(vertical: -4),
        contentPadding: const EdgeInsets.all(0),
        leading: const Icon(
          Icons.history_outlined,
          size: 28,
        ),
        title: Text(
          label,
          style: myTheme.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        trailing: const Icon(
          Icons.arrow_outward_sharp,
          size: 26,
        ),
      ),
    );
  }
}
