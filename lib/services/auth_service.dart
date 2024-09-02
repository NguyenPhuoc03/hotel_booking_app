import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking_app/models/users.dart';
import 'package:hotel_booking_app/services/user_service.dart';

class AuthService {
  final FirebaseAuth _firebasAuth = FirebaseAuth.instance;

  Future<User?> registerWithEmail(
      String fullName, String email, String password) async {
    try {
      UserCredential userCredential = await _firebasAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      //tao user thanh cong
      if (userCredential.user != null) {
        UserService userService = UserService();
        userService.createUserFirestore(Users(
            uid: userCredential.user!.uid,
            email: email,
            fullName: fullName,
            phoneNumber: '',
            createAt: ''));
      }
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('auth_service: $e');
      return null;
    }
    return null;
  }

  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _firebasAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print('(auth_service) Login failed: $e');
      return null;
    }
    return null;
  }

  void signOut() async {
    try {
      await _firebasAuth.signOut();
    } catch (e) {
      print('(auth_service) Logout failed: $e');
    }
  }
}
