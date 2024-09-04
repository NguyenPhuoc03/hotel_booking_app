import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking_app/models/users.dart';

class UserService {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");

  Future<void> createUserFirestore(Users user) async {
    try {
      await collectionReference.doc(user.uid).set(user.toDoc());
    } catch (e) {
      print("user_service: $e");
      throw 'firestore-write-failed';
    }
  }

  Future<void> updateUserFirestore(String uid,
      {String? email, String? fullName, String? phoneNumber}) async {
    Map<String, dynamic> fieldsToUpdate = {};
    if (email != null) {
      fieldsToUpdate['email'] = email;
    }
    if (fullName != null) {
      fieldsToUpdate['fullName'] = fullName;
    }
    if (phoneNumber != null) {
      fieldsToUpdate['phoneNumber'] = phoneNumber;
    }
    if (fieldsToUpdate.isNotEmpty) {
      await collectionReference.doc(uid).update(fieldsToUpdate).then(
          (value) => print("$uid successfully updated"),
          onError: (e) => print("user_service: $e"));
    }
  }

  Future<void> deleteUserFirestore(String uid) async {
    await collectionReference.doc(uid).delete().then(
          (doc) => print("$uid deleted successful"),
          onError: (e) => print("user_service: $e"),
        );
  }
}
