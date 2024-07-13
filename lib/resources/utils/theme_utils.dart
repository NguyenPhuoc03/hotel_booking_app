import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp._();
  static ThemeData myTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
    primaryColor: Colors.blue.shade600,
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        fontFamily: 'RobotoMono',
      ),
      displayMedium: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'RobotoMono',
      ),
      // TextStyle? displaySmall,
      headlineLarge: const TextStyle(
        fontSize: 36.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono',
      ),
      headlineMedium: const TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
      headlineSmall: const TextStyle(
          fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400),
      // TextStyle? titleLarge,
      //titleMedium:
      // TextStyle? titleSmall,
      // TextStyle? bodyLarge,
      bodyMedium: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 18,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.w500),
      bodySmall: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'RobotoMono',
      ),
      // TextStyle? labelLarge,
      // labelMedium: TextStyle(

      // ),
      // TextStyle? labelSmall,
    ),
  );
}
