import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;

  //error
  bool _isError = false;
  String? _errorMessage;
  String? _errorFullName;
  String? _errorEmail;
  String? _errorPassword;
  String? _errorCornfirmPassword;

  User? get user => _user;
  bool get isLoading => _isLoading;

  // get error
  bool get isError => _isError;
  String? get errorMessage => _errorMessage;
  String? get errorFullName => _errorFullName;
  String? get errorEmail => _errorEmail;
  String? get errorPassword => _errorPassword;
  String? get errorCornfirmPassword => _errorCornfirmPassword;

  Future<void> registerWithEmail(
      String fullNameController,
      String emailController,
      String passwordController,
      String cfmPasswordController) async {
    _isLoading = true;
    _isError = false;
    _errorMessage = null;
    _errorFullName = null;
    _errorEmail = null;
    _errorPassword = null;
    _errorCornfirmPassword = null;
    notifyListeners();

    try {
      if (fullNameController.isEmpty ||
          emailController.isEmpty ||
          passwordController.isEmpty ||
          cfmPasswordController.isEmpty) {
        _isError = true;
        if (fullNameController.isEmpty) {
          _errorFullName = "Full name cannot be empty!";
        }
        if (emailController.isEmpty) {
          _errorEmail = "Email cannot be empty!";
        }
        if (passwordController.isEmpty) {
          _errorPassword = "Password cannot be empty!";
        }
        if (cfmPasswordController.isEmpty) {
          _errorCornfirmPassword = "Confirm password cannot be empty!";
        }
        notifyListeners();
        return;
      }
      if (passwordController != cfmPasswordController) {
        _isError = true;
        _errorCornfirmPassword = "Password is not equal confirm password";
        notifyListeners();
        return;
      }

      _user = await _authService.registerWithEmail(
        fullNameController,
        emailController,
        passwordController,
      );
    } catch (e) {
      _isError = true;
      switch (e) {
        case 'firestore-write-failed':
          _errorMessage =
              "Account registration failed. Please try again later!";
          break;
        case 'network-request-failed':
          _errorMessage = "Please check your connection!";
        case 'too-many-requests':
          _errorMessage = "Please try again later!";
        case 'invalid-email':
          _errorEmail = "The email is not valid!";
        case 'email-already-in-use':
          _errorEmail = "Email already exists!";
        case 'weak-pass':
          _errorPassword = "The password provided is too weak!";
        default:
          _errorMessage = "An unknown error occurred!";
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    _isLoading = true;
    _isError = false;
    _errorMessage = null;
    _errorEmail = null;
    _errorPassword = null;
    notifyListeners();

    try {
      _user = await _authService.loginWithEmail(email, password);
    } catch (e) {
      _isError = true;
      switch (e) {
        case 'invalid-email':
          _errorEmail = "The email is not valid!";
        default:
          _errorPassword = "The password is incorrect";
      }
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

  void resetState() {
    _errorEmail = null;
    _errorPassword = null;
    notifyListeners();
  }
}
