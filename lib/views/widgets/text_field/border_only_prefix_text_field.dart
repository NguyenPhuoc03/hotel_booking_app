import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BorderOnlyPrefixTextField extends StatefulWidget {
  BorderOnlyPrefixTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.placeholder,
      this.padding = const EdgeInsets.symmetric(vertical: 8),
      this.errorText,
      this.focusNode,
      this.prefixIcon});
  final TextEditingController controller;
  final String labelText;
  final String placeholder;
  final EdgeInsets padding;
  final Icon? prefixIcon;
  final String? errorText;
  final FocusNode? focusNode;

  @override
  State<BorderOnlyPrefixTextField> createState() =>
      _BorderOnlyPrefixTextFieldState();
}

class _BorderOnlyPrefixTextFieldState extends State<BorderOnlyPrefixTextField> {
  bool isObscurePassword = true;
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Padding(
      padding: widget.padding,
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: false,
        style: myTheme.textTheme.displayMedium,
        decoration: InputDecoration(
          errorText: widget.errorText,
          //neu la textfield cua password thi hien thi icon eye
          contentPadding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
          labelText: widget.labelText,
          labelStyle: myTheme.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.normal, fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.placeholder,
          hintStyle: myTheme.textTheme.headlineSmall?.copyWith(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(),
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
