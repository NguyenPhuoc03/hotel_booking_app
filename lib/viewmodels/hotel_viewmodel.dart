import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:hotel_booking_app/models/hotel.dart';
import 'package:hotel_booking_app/services/hotel_services.dart';

class HotelViewmodel extends ChangeNotifier {
  final HotelServices _hotelServices = HotelServices();
  bool _isPopularLoading = false;
  bool _isDealLoading = false;
  bool _isNearYouLoading = false;
  bool _isMostBookedLoading = false;
  bool _isHighestRatedLoading = false;
  bool _isSearchHotelsLoading = false;

  List<Hotel> _popularHotels = [];
  List<Hotel> _dealHotels = [];
  List<Hotel> _nearYouHotels = [];
  List<Hotel> _mostBookedHotels = [];
  List<Hotel> _highestRatedHotels = [];
  List<Hotel> _searchHotels = [];

  bool get isPopularLoading => _isPopularLoading;
  bool get isDealLoading => _isDealLoading;
  bool get isNearYouLoading => _isNearYouLoading;
  bool get isMostBookedLoading => _isMostBookedLoading;
  bool get isHighestRatedLoading => _isHighestRatedLoading;
  bool get isSearchHotelsLoading => _isSearchHotelsLoading;

  List<Hotel> get popularHotels => _popularHotels; // duoc danh gia nhieu nhat
  List<Hotel> get dealHotels => _dealHotels; // giam gia cao nhat
  List<Hotel> get nearYouHotels => _nearYouHotels; // gan ban
  List<Hotel> get mostBookedHotels => _mostBookedHotels; //duoc book nhieu nhat
  List<Hotel> get highestRatedHotels =>
      _highestRatedHotels; //so sao trung binh cao nhat
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

  Future<void> getMostBookedHotels() async {
    _isMostBookedLoading = true;
    notifyListeners();

    _mostBookedHotels = await _hotelServices.getMostBookedHotels();

    _isMostBookedLoading = false;
    notifyListeners();
  }

  Future<void> getHighestRatedHotels() async {
    _isHighestRatedLoading = true;
    notifyListeners();

    _highestRatedHotels = await _hotelServices.getHighestRatedHotels();

    _isHighestRatedLoading = false;
    notifyListeners();
  }

  Future<void> getHotelsBySearch(String value) async {
    _isSearchHotelsLoading = true;
    notifyListeners();

    //removeDiacritics(value) xoa bo tieng viet, vi du Đinh = Dinh
    _searchHotels = await _hotelServices
        .getHotelsBySearch(removeDiacritics(value).toLowerCase());

    _isSearchHotelsLoading = false;
    notifyListeners();
  }
}
