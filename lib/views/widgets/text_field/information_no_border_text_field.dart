import 'package:flutter/material.dart';

class InformationNoBorderTextField extends StatefulWidget {
  InformationNoBorderTextField({
    super.key,
    required this.labelText,
    required this.placeholder,
    this.isPasswordTextField = false,
    required this.controller,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.errorText,
  });
  final TextEditingController controller;
  final String labelText;
  final String placeholder;
  final bool isPasswordTextField;
  final EdgeInsets padding;
  final String? errorText;

  @override
  State<InformationNoBorderTextField> createState() =>
      _InformationNoBorderTextFieldState();
}

class _InformationNoBorderTextFieldState
    extends State<InformationNoBorderTextField> {
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
          errorText: widget.errorText,
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
