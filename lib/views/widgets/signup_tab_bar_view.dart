import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
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
              Text(
                "Full name",
                style: myTheme.textTheme.bodySmall,
              ),
              TextField(
                controller: rFullNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Email address",
                style: myTheme.textTheme.bodySmall,
              ),
              TextField(
                controller: rEmailAddressController,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Password",
                style: myTheme.textTheme.bodySmall,
              ),
              TextField(
                controller: rPasswordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Confirm password",
                style: myTheme.textTheme.bodySmall,
              ),
              TextField(
                controller: rConfirmPasswordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 20,
                    minimumSize: const Size.fromHeight(60),
                  ),
                  child: Text(
                    "REGISTER",
                    style: myTheme.textTheme.bodyMedium,
                  )),
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
