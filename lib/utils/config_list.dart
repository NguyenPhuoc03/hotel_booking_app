import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/config_key.dart';

class ConfigList {
  static List<Map<String, dynamic>> hotelTypes = [
    {
      ConfigKey.type: ConfigKey.mostBookedHotels,
      ConfigKey.icon: Icons.star
    }, //duoc dat nhieu nhat
    {
      ConfigKey.type:  ConfigKey.highestRatedHotels,  // 'Highest rated',
      ConfigKey.icon: Icons.sentiment_satisfied
    }, // duoc danh gia so sao cao nhat
    {
      ConfigKey.type: 'Luxury hotels',
      ConfigKey.icon: Icons.king_bed
    }, //cao tien nhat
    {
      ConfigKey.type: 'Amenities',
      ConfigKey.icon: Icons.pool
    }, //nhieu tien nghi nhat
  ];
}
