import 'package:flutter/material.dart';
import 'package:hotel_booking_app/resources/utils/onboarding_tabs.dart';
import 'package:hotel_booking_app/viewmodels/onboarding_view_model.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:provider/provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OnboardingViewModel>(context, listen: false)
          .checkLoginStatus(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    myTheme = Theme.of(context);
    return Consumer<OnboardingViewModel>(builder: (context, viewModel, child) {
      return IntroSlider(
        key: UniqueKey(),
        // Skip button
        renderSkipBtn: Text(
          "Skip",
          style: myTheme.textTheme.labelMedium,
        ),
        onSkipPress: () => viewModel.onDoneAndSkipPress(context),
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
        onDonePress: () => viewModel.onDoneAndSkipPress(context),

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
    });
  }
}
