import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/local_storage.dart';
import 'package:hotel_booking_app/utils/shared_preferences_keys.dart';
import 'package:hotel_booking_app/viewmodels/auth_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/button/min_h60_button.dart';
import 'package:hotel_booking_app/views/widgets/text_field/information_no_border_text_field.dart';
import 'package:provider/provider.dart';

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
    bool value = await LocalStorage.getBoolValue(
        SharedPreferencesKeys.isCheckedRemember);
    if (value) {
      String emailUser =
          await LocalStorage.getStringValue(SharedPreferencesKeys.emailUser);
      String passwordUser =
          await LocalStorage.getStringValue(SharedPreferencesKeys.passwordUser);
      setState(() {
        rememberUser = value;
        lEmailAddressController.text = emailUser;
        lPasswordController.text = passwordUser;
      });
    } else {
      setState(() {
        rememberUser = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
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
              InformationNoBorderTextField(
                controller: lEmailAddressController,
                labelText: "Email address",
                placeholder: "",
                errorText: authViewModel.errorEmail,
              ),
              const SizedBox(
                height: 15,
              ),
              InformationNoBorderTextField(
                controller: lPasswordController,
                labelText: "Password",
                placeholder: "",
                isPasswordTextField: true,
                errorText: authViewModel.errorPassword,
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
                    onPressed: () {
                      Navigator.pushNamed(context, 'forgotPassword');
                      authViewModel.resetState();
                    },
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
                  FocusScope.of(context).unfocus();
                  if (!authViewModel.isLoading) {
                    await authViewModel.loginWithEmail(
                      lEmailAddressController.text,
                      lPasswordController.text,
                    );
                    if (!authViewModel.isError) {
                      await context
                          .read<UserViewmodel>()
                          .getCurrentUserFirestore();
                      LocalStorage.setBoolValue(
                          SharedPreferencesKeys.isCheckedRemember,
                          rememberUser);
                      if (rememberUser) {
                        LocalStorage.setStringValue(
                            SharedPreferencesKeys.emailUser,
                            lEmailAddressController.text);
                        LocalStorage.setStringValue(
                            SharedPreferencesKeys.passwordUser,
                            lPasswordController.text);
                      }
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/root", (route) => false);
                    }
                  }
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
