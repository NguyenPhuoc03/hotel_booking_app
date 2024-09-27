import 'package:flutter/material.dart';

class ConfigKey {
  //user
  static String guestId = "guestId";
  //hotel model
  static String hotel = "hotel";
  static String name = "name";
  static String province = "province";
  static String district = "district";
  static String avgRating = "avgRating";
  static String totalReview = "totalReview";
  static String totalBook = "totalBook";
  static String discount = "discount";

  //room model
  static String room = "room";
  static String hotelId = "hotelId";
  static String roomId = "roomId";
  static String selectedRooms = "selectedRooms";
  static String roomName = "roomName";

  static String roomPrice = "roomPrice";
  static String byNight = "byNight";
  static String byHour = "byHour";
  

  //booking
  static String booking = "booking";
  static String numberOfRooms = "numberOfRooms";
  static String checkInTime = "checkInTime";
  static String checkOutTime = "checkOutTime";
  static String status = "status";
  static String active = "active";
  static String completed = "completed";
  static String cancel = "cancel";

  //review
  static String review = "review";
  //avatar
  static const String avatarUrl =
      "https://res.cloudinary.com/phuochn/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1726408794/images_ry5be8.jpg";

  //error
  static const String unknown = "Unknown";
  static const String error = "error";

  //arguments hotel list
  static const String type = "type";
  static const String icon = "icon";
  static const String popularHotels = "Popular Hotels";
  static const String dealHotels = "Hot Hotel Deals";
  static const String nearYouHotels = "Near You Hotels";

  static final Map<String, IconData> iconMap = {
    'wifi': Icons.wifi,
    'bath': Icons.bathtub_sharp,
    'tivi': Icons.tv,
    'air-conditioner': Icons.ac_unit_rounded,
    'e-sport': Icons.sports_esports,
    'tennis': Icons.sports_tennis,
    'golf': Icons.sports_golf,
    'error': Icons.error_outlined,
  };
}
