import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  ConfirmButton(
      {super.key, required this.onPressed, required this.labelButton});
  final VoidCallback onPressed;
  final String labelButton;
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade400,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        labelButton,
        style: myTheme.textTheme.headlineSmall,
      ),
    );
  }
}
