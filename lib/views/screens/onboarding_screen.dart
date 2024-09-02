import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/local_storage.dart';
import 'package:hotel_booking_app/utils/onboarding_tabs.dart';
import 'package:hotel_booking_app/utils/shared_preferences_keys.dart';
import 'package:intro_slider/intro_slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return IntroSlider(
      key: UniqueKey(),
      // Skip button
      renderSkipBtn: Text(
        "Skip",
        style: myTheme.textTheme.labelMedium,
      ),
      onSkipPress: () {
        LocalStorage.setBoolValue(SharedPreferencesKeys.hasVisitedApp, true);
        Navigator.pushNamed(context, "/auth");
      },
      // Next button
      renderNextBtn: const Icon(
        Icons.east_outlined,
        size: 35.0,
      ),

      // Done button
      renderDoneBtn: Text(
        "Done",
        style: myTheme.textTheme.labelMedium,
      ),
      onDonePress: () {
        LocalStorage.setBoolValue(SharedPreferencesKeys.hasVisitedApp, true);
        Navigator.pushNamed(context, "/auth");
      },

      // Indicator (cham tron)
      indicatorConfig: IndicatorConfig(
        colorActiveIndicator: Colors.blue.shade900,
        sizeIndicator: 8.0,
        typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
      ),

      // Custom tabs
      listCustomTabs: OnboardingTabs.generateListCustomTabs(),
      backgroundColorAllTabs: Colors.white,

      // Behavior
      scrollPhysics: const BouncingScrollPhysics(),
    );
  }
}
