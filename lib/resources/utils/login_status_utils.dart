import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkLoginStatus(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLogin = prefs.getBool('isLogin') ?? false;
  if (isLogin) {
    Navigator.pushReplacementNamed(context, "/auth");
  }
}

