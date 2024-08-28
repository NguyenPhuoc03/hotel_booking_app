import 'package:flutter/material.dart';

class ProfileItemListTitle extends StatelessWidget {
  ProfileItemListTitle({super.key, required this.leading, required this.title});
  final Icon leading;
  final String title;
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(
        leading.icon,
        size: 32,
        color: leading.color,
      ),
      title: Text(
        title,
        style: myTheme.textTheme.bodyMedium,
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 25,),
    );
  }
}
