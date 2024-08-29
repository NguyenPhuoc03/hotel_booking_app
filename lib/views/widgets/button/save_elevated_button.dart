import 'package:flutter/material.dart';

class SaveElevatedButton extends StatelessWidget {
  SaveElevatedButton(
      {super.key,
      required this.onPressed,
      required this.labelButton,
      Color? backgroundColor}) : backgroundColor = backgroundColor ?? Colors.blue.shade600;
  final VoidCallback onPressed;
  final String labelButton;
  final Color backgroundColor;
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        labelButton,
        style: myTheme.textTheme.titleMedium,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), )),
    );
  }
}
