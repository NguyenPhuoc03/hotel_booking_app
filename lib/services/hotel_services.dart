import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diacritic/diacritic.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';

class HotelServices {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(ConfigKey.hotel);
  final UserViewmodel _userViewmodel = UserViewmodel();

  Future<List<Hotel>> getAllHotels() async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .orderBy(ConfigKey.name, descending: true)
          .get();
      return querySnapshot.docs.map((doc) => Hotel.fromFirestore(doc)).toList();
    } catch (e, stacktrace) {
      print("(hotel_services) Error fetching data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return [];
    }
  }

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

  Future<List<Hotel>> getMostBookedHotels() async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .orderBy(ConfigKey.totalBook, descending: true)
          .get();
      return querySnapshot.docs.map((doc) => Hotel.fromFirestore(doc)).toList();
    } catch (e, stacktrace) {
      print("(hotel_services) Error fetching data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return [];
    }
  }

  Future<List<Hotel>> getHighestRatedHotels() async {
    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .orderBy(ConfigKey.avgRating, descending: true)
          .get();
      return querySnapshot.docs.map((doc) => Hotel.fromFirestore(doc)).toList();
    } catch (e, stacktrace) {
      print("(hotel_services) Error fetching data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return [];
    }
  }

  //search
  Future<List<Hotel>> getHotelsBySearch(String keySearch) async {
    try {
      List<Hotel> allHotels = await getAllHotels();
      List<Hotel> searchResults = [];

      allHotels.forEach((index) {
        if (index.name.toLowerCase().contains(keySearch)
            ||
                index.address[ConfigKey.province]!.toLowerCase().contains(keySearch) ||
                index.address[ConfigKey.district]!.toLowerCase().contains(keySearch)
            ) {
          searchResults.add(index);
        }
      });
      return searchResults;
    } catch (e, stacktrace) {
      print("(hotel_services) Error fetching data: $e");
      //hien thi chi tiet loi
      print("Stacktrace: $stacktrace");
      return [];
    }
  }

  //! toi uu hoa code get hotel, them arguments
}
