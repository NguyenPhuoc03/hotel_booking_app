import 'package:location/location.dart ';

class LocationService {
  final _location = Location();
  //kiem tra va yeu cau quyen truy cap vi tri
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return false;
      } 
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print('Location permissions are denied');
        return false;
      } 
      if (permissionGranted == PermissionStatus.deniedForever) {
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
        return false;
      }
    }
    return true;
  }

  Future<LocationData?> getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) {
      return null;
    }
    LocationData locationData = await _location.getLocation();

    return locationData;
  }
}
