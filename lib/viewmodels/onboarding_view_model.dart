import 'package:flutter/material.dart';
import 'package:hotel_booking_app/resources/utils/local_storage.dart';

class OnboardingViewModel extends ChangeNotifier {
  Future<void> checkLoginStatus(BuildContext context) async {
    bool isLogin = await LocalStorage.getBoolValue("isLogin");
    if (isLogin) {
      Navigator.pushReplacementNamed(context, "/auth");
    }
  }

  void onDoneAndSkipPress(BuildContext context) {
    Navigator.pushNamed(context, "/auth");
  }
}
