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
      // User creation successful
      if (userCredential.user != null) {
        UserService userService = UserService();
        //xu li loi neu thanh cong o auth nhung that bai o firestore
        try {
          await userService.createUserFirestore(Users(
              uid: userCredential.user!.uid,
              email: email,
              fullName: fullName,
              phoneNumber: '',
              createAt: ''));
        } catch (firestoreError) {
          await userCredential.user!.delete();
          throw 'firestore-write-failed';
        }
      }
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          throw 'network-request-failed';
        case 'too-many-requests':
          throw 'too-many-requests';
        case 'invalid-email':
          throw 'invalid-email';
        case 'email-already-in-use':
          throw 'email-already-in-use';
        case 'weak-password':
          throw 'weak-pass';
        default:
          throw 'unknown';
      }
    } catch (e) {
      print('auth_service: $e');
      return null;
    }
  }

  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _firebasAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw 'invalid-email';
        case 'wrong-password':
          throw 'wrong-password';
        default:
          throw 'unknown';
      }
    } catch (e) {
      print('(auth_service) Login failed: $e');
      return null;
    }
  }

  void signOut() async {
    try {
      await _firebasAuth.signOut();
    } catch (e) {
      print('(auth_service) Logout failed: $e');
    }
  }
}
