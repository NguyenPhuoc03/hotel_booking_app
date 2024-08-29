import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/button/min_h60_button.dart';
import 'package:hotel_booking_app/views/widgets/text_field/information_text_field.dart';
import 'package:provider/provider.dart';

class SignupTabBarView extends StatefulWidget {
  const SignupTabBarView({super.key});

  @override
  State<SignupTabBarView> createState() => _SignupTabBarViewState();
}

class _SignupTabBarViewState extends State<SignupTabBarView> {
  late ThemeData myTheme;
  TextEditingController rFullNameController = TextEditingController();
  TextEditingController rEmailAddressController = TextEditingController();
  TextEditingController rPasswordController = TextEditingController();
  TextEditingController rConfirmPasswordController = TextEditingController();

  @override
  void dispose() {
    //textfield bi xoa thi controller dung lang nghe va bi xoa
    rFullNameController.dispose();
    rEmailAddressController.dispose();
    rPasswordController.dispose();
    rConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Your Account",
              style: myTheme.textTheme.headlineMedium
                  ?.copyWith(color: myTheme.primaryColor),
            ),
            Text(
              "Please register with your information",
              style: myTheme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: 25,
            ),
            InformationTextField(
              controller: rFullNameController,
              labelText: "Full name",
              placeholder: "",
            ),
            const SizedBox(
              height: 15,
            ),
            InformationTextField(
              controller: rEmailAddressController,
              labelText: "Email address",
              placeholder: "",
            ),
            const SizedBox(
              height: 15,
            ),
            InformationTextField(
              controller: rPasswordController,
              labelText: "Password",
              placeholder: "",
              isPasswordTextField: true,
            ),
            const SizedBox(
              height: 15,
            ),
            InformationTextField(
              controller: rConfirmPasswordController,
              labelText: "Confirm password",
              placeholder: "",
              isPasswordTextField: true,
            ),
            const SizedBox(
              height: 15,
            ),
            MinH60Button(
              onPressed: () {},
              labelButton: "REGISTER",
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Or login with",
                    style: myTheme.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Tab(icon: Image.asset("assets/images/facebook.png")),
                      Tab(
                        icon: Image.asset("assets/images/google.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
