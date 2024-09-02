import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> registerWithEmail(String fullName, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _authService.registerWithEmail(fullName, email, password);
    } catch (e) {
      print('Signup failed in auth_viewmodel : $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      _user = await _authService.loginWithEmail(email, password);
    } catch (e) {
      print('Login failed in auth_viewmodel : $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
