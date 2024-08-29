import 'package:flutter/material.dart';
import 'package:hotel_booking_app/resources/utils/local_storage.dart';
import 'package:hotel_booking_app/views/widgets/button/min_h60_button.dart';
import 'package:hotel_booking_app/views/widgets/text_field/information_text_field.dart';

class LoginTabBarView extends StatefulWidget {
  const LoginTabBarView({super.key});

  @override
  State<LoginTabBarView> createState() => _LoginTabBarViewState();
}

class _LoginTabBarViewState extends State<LoginTabBarView> {
  late ThemeData myTheme;
  TextEditingController lEmailAddressController = TextEditingController();
  TextEditingController lPasswordController = TextEditingController();
  bool rememberUser = false;

  @override
  void initState() {
    super.initState();

    _getCheckRemember();
  }

  @override
  void dispose() {
    //textfield bi xoa thi controller dung lang nghe va bi xoa
    lEmailAddressController.dispose();
    lPasswordController.dispose();
    super.dispose();
  }

  Future<void> _getCheckRemember() async {
    bool value = await LocalStorage.getBoolValue('isCheckedRemember');
    setState(() {
      rememberUser = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: myTheme.textTheme.headlineMedium
                    ?.copyWith(color: myTheme.primaryColor),
              ),
              Text(
                "Please login with your information",
                style: myTheme.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 50,
              ),
              InformationTextField(
                controller: lEmailAddressController,
                labelText: "Email address",
                placeholder: "",
              ),
              const SizedBox(
                height: 15,
              ),
              InformationTextField(
                controller: lPasswordController,
                labelText: "Password",
                placeholder: "",
                isPasswordTextField: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Checkbox(
                        value: rememberUser,
                        onChanged: (value) {
                          setState(() {
                            rememberUser = value!;
                          });
                        }),
                    Text(
                      "Remember me",
                      style: myTheme.textTheme.bodySmall,
                    ),
                  ]),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "I forgot my password",
                      style: myTheme.textTheme.bodySmall,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MinH60Button(
                onPressed: () async {
                  LocalStorage.setBoolValue("isCheckedRemember", rememberUser);
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/root", (route) => false);
                },
                labelButton: "LOGIN",
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Or login with",
                      style: myTheme.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tab(icon: Image.asset("assets/images/facebook.png")),
                        Tab(
                          icon: Image.asset("assets/images/google.png"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
