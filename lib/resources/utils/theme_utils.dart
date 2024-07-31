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
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.w500),
      bodySmall: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'RobotoMono',
      ),
      labelLarge: TextStyle(
          fontSize: 28,
          color: Colors.blue.shade900,
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 18,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontSize: 14,
          color: Colors.blue.shade900,
          fontWeight: FontWeight.w500),
    ),
  );
}
