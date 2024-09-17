import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hotel_booking_app/models/users.dart';
import 'package:hotel_booking_app/services/location_service.dart';
import 'package:hotel_booking_app/services/user_service.dart';
import 'package:hotel_booking_app/utils/config_key.dart';
import 'package:location/location.dart';

class UserViewmodel extends ChangeNotifier {
  final UserService _userService = UserService();
  final LocationService _locationService = LocationService();
  Users? _user;
  bool _isLoading = false;
  Map<String, String>? _address;

  Users? get user => _user;
  bool get isLoading => _isLoading;
  Map<String, String>? get address => _address;

  UserViewmodel() {
    getCurrentUserLocation();
  }

  Future<void> getCurrentUserFirestore() async {
    _isLoading = true;
    notifyListeners();

    _user = await _userService.getCurrentUserFirestore();
    _isLoading = false;
    notifyListeners();
  }

  // phan tich (lat, long) => dia chi
  Future<Map<String, String>?> convertAddressFromLocationData(
      LocationData location) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude!,
        location.longitude!,
      );
      if (placemarks.isEmpty) {
        return null;
      }
      Map<String, String> address = {
        ConfigKey.district: placemarks[0].locality!,
        ConfigKey.province: placemarks[0].administrativeArea!,
      };
      return address;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, String>?> getCurrentUserLocation() async {
    LocationData? location = await _locationService.getCurrentLocation();

    Map<String, String>? _address =
        await convertAddressFromLocationData(location!);
    notifyListeners();

    return _address;
  }
}
