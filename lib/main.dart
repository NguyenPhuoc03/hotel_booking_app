import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/local_storage.dart';
import 'package:hotel_booking_app/utils/shared_preferences_keys.dart';
import 'package:hotel_booking_app/utils/theme_utils.dart';
import 'package:hotel_booking_app/viewmodels/auth_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/booking_view_model.dart';
import 'package:hotel_booking_app/viewmodels/hotel_viewmodel.dart';
import 'package:hotel_booking_app/viewmodels/user_viewmodel.dart';
import 'package:hotel_booking_app/views/screens/booking_confirmation_screen.dart';
import 'package:hotel_booking_app/views/screens/change_password_screen.dart';
import 'package:hotel_booking_app/views/screens/edit_profile_screen.dart';
import 'package:hotel_booking_app/views/screens/auth_screen.dart';
import 'package:hotel_booking_app/views/screens/forgot_password_screen.dart';
import 'package:hotel_booking_app/views/screens/hotel_detail_screen.dart';
import 'package:hotel_booking_app/views/screens/hotel_list_screen.dart';
import 'package:hotel_booking_app/views/screens/notification_screen.dart';
import 'package:hotel_booking_app/views/screens/onboarding_screen.dart';
import 'package:hotel_booking_app/views/screens/root_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool hasVisitedApp =
      await LocalStorage.getBoolValue(SharedPreferencesKeys.hasVisitedApp);

  runApp(MyApp(hasVisitedApp: hasVisitedApp));
}

class MyApp extends StatelessWidget {
  final bool hasVisitedApp;
  const MyApp({Key? key, required this.hasVisitedApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookingViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => HotelViewmodel()),
        ChangeNotifierProvider(create: (_) => UserViewmodel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.myTheme,
        title: "Booking Hotel",
        initialRoute: hasVisitedApp ? '/auth' : '/onboarding',
        routes: {
          '/onboarding': (context) => OnboardingScreen(),
          '/root': (context) => RootScreen(),
          '/auth': (context) => AuthScreen(),
          '/notification': (context) => NotificationScreen(),
          'hotelDetail': (context) => HotelDetailScreen(),
          'bookingConfirmation': (context) => BookingConfirmationScreen(),
          '/hotelList': (context) => HotelListScreen(),
          '/editProfile': (context) => EditProfileScreen(),
          '/changePassword': (context) => ChangePasswordScreen(),
          'forgotPassword': (context) => ForgotPasswordScreen(),
        },
      ),
    );
  }
}
