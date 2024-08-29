import 'package:flutter/material.dart';

class InformationTextField extends StatefulWidget {
  InformationTextField({
    super.key,
    required this.labelText,
    required this.placeholder,
    this.isPasswordTextField = false,
    required this.controller,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  });
  final TextEditingController controller;
  final String labelText;
  final String placeholder;
  final bool isPasswordTextField;
  final EdgeInsets padding;

  @override
  State<InformationTextField> createState() => _InformationTextFieldState();
}

class _InformationTextFieldState extends State<InformationTextField> {
  bool isObscurePassword = true;
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Padding(
      padding: widget.padding,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPasswordTextField ? isObscurePassword : false,
        style: myTheme.textTheme.displayMedium,
        decoration: InputDecoration(
          //neu la textfield cua password thi hien thi icon eye
          suffixIcon: widget.isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                  icon: Icon(
                    isObscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 4),
          labelText: widget.labelText,
          labelStyle: myTheme.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.normal, fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.placeholder,
          hintStyle: myTheme.textTheme.headlineSmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
