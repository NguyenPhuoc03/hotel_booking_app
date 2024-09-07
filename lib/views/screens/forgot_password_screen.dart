import 'package:flutter/material.dart';
import 'package:hotel_booking_app/viewmodels/auth_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/button/w120_h50_button.dart';
import 'package:hotel_booking_app/views/widgets/text_field/border_only_prefix_text_field.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData myTheme;
  TextEditingController rEmailAddressController = TextEditingController();

  @override
  void dispose() {
    rEmailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text("Reset Password"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Quay lại màn hình trước
            Navigator.of(context).pop();
            authViewModel.resetState();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
              "Enter your email and we will send you a password reset link",
              textAlign: TextAlign.center),
          const SizedBox(
            height: 10,
          ),
          BorderOnlyPrefixTextField(
            controller: rEmailAddressController,
            labelText: "",
            placeholder: "example@gmail.com",
            errorText: authViewModel.errorEmail,
            prefixIcon: const Icon(Icons.email),
          ),
          const SizedBox(
            height: 10,
          ),
          W120H50Button(
            onPressed: () async {
              //tat ban phim
              FocusScope.of(context).unfocus();
              if (!authViewModel.isLoading) {
                await authViewModel.resetPasswordWithEmail(
                    rEmailAddressController.text.trim());
                !authViewModel.isError ? await _dialogBuilder(context) : null;
              }
            },
            labelButton: 'Reset',
          )
        ]),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password reset link sent! Check your email."),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                    //textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
