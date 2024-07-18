import 'package:flutter/material.dart';
import 'package:hotel_booking_app/resources/utils/theme_utils.dart';
import 'package:hotel_booking_app/viewmodels/onboarding_view_model.dart';
import 'package:hotel_booking_app/views/home_screen.dart';
import 'package:hotel_booking_app/views/auth_screen.dart';
import 'package:hotel_booking_app/views/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OnboardingViewModel>(
            create: (_) => OnboardingViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.myTheme,
        title: "Booking Hotel",
        initialRoute: "/",
        routes: {
          '/': (context) => OnboardingScreen(),
          '/home': (context) => HomeScreen(),
          '/auth': (context) => AuthScreen(),
        },
      ),
    );
  }
}
