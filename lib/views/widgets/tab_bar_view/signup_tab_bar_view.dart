import 'package:flutter/material.dart';
import 'package:hotel_booking_app/viewmodels/auth_viewmodel.dart';
import 'package:hotel_booking_app/views/widgets/button/min_h60_button.dart';
import 'package:hotel_booking_app/views/widgets/text_field/information_no_border_text_field.dart';
import 'package:provider/provider.dart';

class SignupTabBarView extends StatefulWidget {
  final VoidCallback onRegisterSuccess;
  const SignupTabBarView({super.key, required this.onRegisterSuccess});

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
    final authViewModel = Provider.of<AuthViewModel>(context);
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
            //widget neu dang ki co loi: firebase, internet,...
            authViewModel.isError
                ? Container(
                    color: Colors.transparent,
                    height: 25,
                    child: Center(
                      child: Text(
                        authViewModel.errorMessage ?? '',
                        style: myTheme.textTheme.bodySmall!
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 25,
                  ),
            InformationNoBorderTextField(
              controller: rFullNameController,
              labelText: "Full name",
              placeholder: "",
              errorText: authViewModel.errorFullName,
            ),
            const SizedBox(
              height: 10,
            ),
            InformationNoBorderTextField(
              controller: rEmailAddressController,
              labelText: "Email address",
              placeholder: "",
              errorText: authViewModel.errorEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            InformationNoBorderTextField(
              controller: rPasswordController,
              labelText: "Password",
              placeholder: "",
              isPasswordTextField: true,
              errorText: authViewModel.errorPassword,
            ),
            const SizedBox(
              height: 10,
            ),
            InformationNoBorderTextField(
              controller: rConfirmPasswordController,
              labelText: "Confirm password",
              placeholder: "",
              isPasswordTextField: true,
              errorText: authViewModel.errorCornfirmPassword,
            ),
            const SizedBox(
              height: 15,
            ),
            MinH60Button(
              onPressed: () async {
                //tat ban phim
                FocusScope.of(context).unfocus();
                if (!authViewModel.isLoading) {
                  await authViewModel.registerWithEmail(
                      rFullNameController.text,
                      rEmailAddressController.text,
                      rPasswordController.text,
                      rConfirmPasswordController.text);
                  //neu khong co loi (isError == false) thi moi chuyen tab
                  if (!authViewModel.isError) {
                    widget.onRegisterSuccess();
                  }
                }
              },
              labelButton: "REGISTER",
            ),
          ],
        ),
      ),
    );
  }
}
