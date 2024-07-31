import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;
  void togglePasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
