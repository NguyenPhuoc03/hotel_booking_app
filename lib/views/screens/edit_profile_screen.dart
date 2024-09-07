import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/button/cancel_outline_button.dart';
import 'package:hotel_booking_app/views/widgets/button/save_elevated_button.dart';
import 'package:hotel_booking_app/views/widgets/text_field/information_no_border_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        elevation: 0.0,
        backgroundColor: Colors.blue.shade400,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(32, 20, 32, 0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWVsm9smljjDm9Ta08_It5JxUFPKIO6ZPfbA&s'),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InformationNoBorderTextField(
                controller: fullNameController,
                labelText: "Full Name",
                placeholder: "Jonh Anne",
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              InformationNoBorderTextField(
                controller: emailController,
                labelText: "Email address",
                placeholder: "example@gmail.com",
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              InformationNoBorderTextField(
                controller: phoneController,
                labelText: "Phone",
                placeholder: "+84xxxxxxxxx",
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              InformationNoBorderTextField(
                controller: birthDateController,
                labelText: "Birthdate",
                placeholder: "10/01/2003",
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              InformationNoBorderTextField(
                controller: birthDateController,
                labelText: "Location",
                placeholder: "Quy Nhon",
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CancelOutlineButton(
                    onPressed: () {},
                    labelButton: "Cancel",
                  ),
                  SaveElevatedButton(
                    onPressed: () {},
                    labelButton: "Save",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ))
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
  }
}
