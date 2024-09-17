import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diacritic/diacritic.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';

class HotelServices {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(ConfigKey.hotel);
  final UserViewmodel _userViewmodel = UserViewmodel();

  Future<List<Hotel>> getPopularHotels() async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .orderBy(ConfigKey.totalReview, descending: true)
          .get();
      return querySnapshot.docs.map((doc) => Hotel.fromFirestore(doc)).toList();
    } catch (e, stacktrace) {
      print("(hotel_services) Error fetching data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return [];
    }
  }

  Future<List<Hotel>> getDealHotels() async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .orderBy(ConfigKey.discount, descending: true)
          .get();
      List<Hotel> dealHotels = [];

      for (var doc in querySnapshot.docs) {
        Hotel hotel = Hotel.fromFirestore(doc);
        if (hotel.discount > 0) {
          dealHotels.add(hotel);
        }
      }
      return dealHotels;
    } catch (e, stacktrace) {
      print("(hotel_services) Error fetching data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return [];
    }
  }

  Future<List<Hotel>> getNearYouHotels() async {
    try {
      //get location user
      Map<String, String>? address =
          await _userViewmodel.getCurrentUserLocation();
      print(address);
      if (address == null) return [];
      QuerySnapshot querySnapshot = await _collectionReference
          .where('address.province',
              isEqualTo: removeDiacritics(address[ConfigKey.province]!))
          .get();      
      return querySnapshot.docs.map((doc) => Hotel.fromFirestore(doc)).toList();
    } catch (e, stacktrace) {
      print("(hotel_services) Error fetching data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return [];
    }
  }
}
