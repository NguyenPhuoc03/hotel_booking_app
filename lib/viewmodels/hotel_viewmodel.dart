import 'package:flutter/foundation.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/services/hotel_services.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';

class HotelViewmodel extends ChangeNotifier {
  HotelServices _hotelServices = HotelServices();
  UserViewmodel _userViewmodel = UserViewmodel();
  bool _isPopularLoading = false;
  bool _isDealLoading = false;
  bool _isNearYouLoading = false;
  List<Hotel> _popularHotels = [];
  List<Hotel> _dealHotels = [];
  List<Hotel> _nearYouHotels = [];

  bool get isPopularLoading => _isPopularLoading;
  bool get isDealLoading => _isDealLoading;
  bool get isNearYouLoading => _isNearYouLoading;
  List<Hotel> get popularHotels => _popularHotels;
  List<Hotel> get dealHotels => _dealHotels;
  List<Hotel> get nearYouHotels => _nearYouHotels;

  //khoi tao khi goi multiprovider va tu dong goi cac fuction get hotel
  HotelViewmodel() {
    fetchData();
  }

  void fetchData() {
    getPopularHotels();
    getDealsHotels();
    getNearYouHotels();
  }

  Future<void> getPopularHotels() async {
    _isPopularLoading = true;
    notifyListeners();

    _popularHotels = await _hotelServices.getPopularHotels();

    _isPopularLoading = false;
    notifyListeners();
  }

  Future<void> getDealsHotels() async {
    _isDealLoading = true;
    notifyListeners();

    _dealHotels = await _hotelServices.getDealHotels();

    _isDealLoading = false;
    notifyListeners();
  }

  Future<void> getNearYouHotels() async {
    _isNearYouLoading = true;
    notifyListeners();

    _nearYouHotels = await _hotelServices.getNearYouHotels();

    _isNearYouLoading = false;
    notifyListeners();
  }
}
