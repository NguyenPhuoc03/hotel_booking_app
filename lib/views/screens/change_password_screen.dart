import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/button/save_elevated_button.dart';
import 'package:hotel_booking_app/views/widgets/text_field/information_no_border_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late ThemeData myTheme;
  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        elevation: 0.0,
        backgroundColor: Colors.blue.shade400,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: Column(
          children: [
            InformationNoBorderTextField(
              controller: currentPasswordController,
              labelText: "Enter password",
              placeholder: "********",
              isPasswordTextField: true,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            InformationNoBorderTextField(
              controller: newPasswordController,
              labelText: "Enter new password",
              placeholder: "********",
              isPasswordTextField: true,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            InformationNoBorderTextField(
              controller: confirmPasswordController,
              labelText: "Enter confirm password",
              placeholder: "********",
              isPasswordTextField: true,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            SizedBox(
              height: 15,
            ),
            SaveElevatedButton(
              onPressed: () {},
              labelButton: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
