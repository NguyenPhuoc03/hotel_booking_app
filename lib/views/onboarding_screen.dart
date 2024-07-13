import 'package:flutter/material.dart';
import 'package:hotel_booking_app/resources/utils/login_status_utils.dart';
import 'package:hotel_booking_app/resources/utils/onboarding_tabs.dart';
import 'package:intro_slider/intro_slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late ThemeData myTheme;

  @override
  void initState() {
    super.initState();
    checkLoginStatus(context);
  }

  void onDoneAndSkipPress() {
    Navigator.pushNamed(context, "/auth");
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return IntroSlider(
      key: UniqueKey(),
      // Skip button
      renderSkipBtn: Text(
        "Skip",
        style: myTheme.textTheme.bodyMedium,
      ),
      onSkipPress: onDoneAndSkipPress,
      // Next button
      renderNextBtn: const Icon(
        Icons.east_outlined,
        size: 35.0,
      ),

      // Done button
      renderDoneBtn: Text(
        "Done",
        style: myTheme.textTheme.bodyMedium,
      ),
      onDonePress: onDoneAndSkipPress,

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
