import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hotel_booking_app/viewmodels/signup_view_model.dart';

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
    return Consumer<SignupViewModel>(
      builder: (context, viewModel, child) {
        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
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
                  style: myTheme.textTheme.displayMedium,
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
                  style: myTheme.textTheme.displayMedium,
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
                  obscureText: viewModel.isPasswordVisible,
                  style: myTheme.textTheme.displayMedium,
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
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        viewModel.toggleConfirmPasswordVisible;
                      },
                      icon: Icon(
                        viewModel.isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: viewModel.isConfirmPasswordVisible,
                  style: myTheme.textTheme.displayMedium,
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
                  ),
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
      },
    );
  }
}
