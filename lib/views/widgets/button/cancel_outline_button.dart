import 'package:flutter/material.dart';

class CancelOutlineButton extends StatelessWidget {
  CancelOutlineButton(
      {super.key, required this.onPressed, required this.labelButton});
  final VoidCallback onPressed;
  final String labelButton;
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        labelButton,
        style: myTheme.textTheme.labelMedium,
      ),
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
