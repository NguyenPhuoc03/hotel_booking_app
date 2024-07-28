import 'package:flutter/material.dart';
import 'package:hotel_booking_app/views/home_screen.dart';
import 'package:hotel_booking_app/views/notification_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    NotificationScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.black87,
        iconSize: 28,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile")
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _screens[_currentIndex],
    );
  }
}
