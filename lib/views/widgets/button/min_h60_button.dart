import 'package:flutter/material.dart';

class MinH60Button extends StatelessWidget {
  MinH60Button({super.key, required this.onPressed, required this.labelButton});
  final VoidCallback onPressed;
  final String labelButton;
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade600,
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: const Size.fromHeight(60),
      ),
      child: Text(
        labelButton,
        style: myTheme.textTheme.bodyMedium,
      ),
    );
  }
}
