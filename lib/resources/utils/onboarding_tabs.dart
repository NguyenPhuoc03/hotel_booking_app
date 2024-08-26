import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/widgets/other/custom_tab_container.dart';

class OnboardingTabs {
  static final List<Widget> listWidget = [
    CustomTabContainer(
      title: "Fabulous or Free",
      subTitle: "Enjoy a fabulous hospitality else we pay for you.",
      imagePath: "assets/images/intro_slider_3.jpg",
    ),
    CustomTabContainer(
      title: "Manage bookings",
      subTitle: "Bookings & Cancellation anytime, anywhere you want to.",
      imagePath: "assets/images/intro_slider_2.jpg",
    ),
    CustomTabContainer(
      title: "Find Best Deals",
      subTitle: "Stay with us and find best deals on every stay.",
      imagePath: "assets/images/intro_slider_1.jpg",
    ),
  ];

  static List<Widget> generateListCustomTabs() {
    return List.generate(listWidget.length, (index) => listWidget[index]);
  }
}
