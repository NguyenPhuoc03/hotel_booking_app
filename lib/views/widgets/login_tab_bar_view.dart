import 'package:flutter/material.dart';
import 'package:hotel_booking_app/viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> _getCheckRemember() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberUser = prefs.getBool('isCheckedRemember') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Consumer<LoginViewModel>(builder: (context, viewModel, child) {
      return Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                Text(
                  "Email address",
                  style: myTheme.textTheme.bodySmall,
                ),
                TextField(
                  controller: lEmailAddressController,
                  style: myTheme.textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: myTheme.textTheme.bodySmall,
                ),
                TextField(
                  controller: lPasswordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: viewModel.togglePasswordVisible,
                      icon: Icon(
                        viewModel.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  style: myTheme.textTheme.displayMedium,
                  obscureText: viewModel.isPasswordVisible,
                ),
                const SizedBox(
                  height: 20,
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
                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setBool(
                          "isCheckedRemember", rememberUser);
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/root", (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      elevation: 20,
                      minimumSize: const Size.fromHeight(60),
                    ),
                    child: Text(
                      "LOGIN",
                      style: myTheme.textTheme.bodyMedium,
                    )),
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
    });
  }
}
