import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/services/hotel_service.dart';

class HotelViewmodel extends ChangeNotifier {
  final HotelService _hotelService = HotelService();
  bool _isPopularLoading = false;
  bool _isDealLoading = false;
  bool _isNearYouLoading = false;
  bool _isSearchHotelsLoading = false;

  List<Hotel> _popularHotels = [];
  List<Hotel> _dealHotels = [];
  List<Hotel> _nearYouHotels = [];
  List<Hotel> _searchHotels = [];

  bool get isPopularLoading => _isPopularLoading;
  bool get isDealLoading => _isDealLoading;
  bool get isNearYouLoading => _isNearYouLoading;
  bool get isSearchHotelsLoading => _isSearchHotelsLoading;

  List<Hotel> get popularHotels => _popularHotels; // duoc danh gia nhieu nhat
  List<Hotel> get dealHotels => _dealHotels; // giam gia cao nhat
  List<Hotel> get nearYouHotels => _nearYouHotels; // gan ban
  List<Hotel> get searchHotels => _searchHotels;

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

    _popularHotels = await _hotelService.getPopularHotels();

    _isPopularLoading = false;
    notifyListeners();
  }

  Future<void> getDealsHotels() async {
    _isDealLoading = true;
    notifyListeners();

    _dealHotels = await _hotelService.getDealHotels();

    _isDealLoading = false;
    notifyListeners();
  }

  Future<void> getNearYouHotels() async {
    _isNearYouLoading = true;
    notifyListeners();

    _nearYouHotels = await _hotelService.getNearYouHotels();

    _isNearYouLoading = false;
    notifyListeners();
  }

  Future<void> getHotelsBySearch(String value) async {
    _isSearchHotelsLoading = true;
    notifyListeners();

    //removeDiacritics(value) xoa bo tieng viet, vi du Đinh = Dinh
    _searchHotels = await _hotelService
        .getHotelsBySearch(removeDiacritics(value).toLowerCase());

    _isSearchHotelsLoading = false;
    notifyListeners();
  }

  Future<Hotel?> getHotelById(String hid) async {
    Hotel? hotel = await _hotelService.getHotelById(hid);
    notifyListeners();
    return hotel;
  }
}
