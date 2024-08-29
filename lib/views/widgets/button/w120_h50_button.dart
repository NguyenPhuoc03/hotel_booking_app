import 'package:flutter/material.dart';

class W120H50Button extends StatelessWidget {
  W120H50Button(
      {super.key,
      required this.onPressed,
      required this.labelButton,
      Color? backgroundColor})
      : backgroundColor = backgroundColor ?? Colors.blue.shade600;
  final VoidCallback onPressed;
  final String labelButton;
  final Color backgroundColor;
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(120, 50),
      ),
      child: Text(
        labelButton,
        style: myTheme.textTheme.titleMedium?.copyWith(
          letterSpacing: 1.25,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
