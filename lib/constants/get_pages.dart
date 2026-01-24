import 'package:e_commerce_app/view/screens/favorite_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/screens/profile.dart';
import 'package:get/get.dart';

import '../view/authentication/create_account_screen.dart';
import '../view/authentication/verification_screen.dart';
import '../view/onboading/main_onboarding.dart';
import '../view/widgets/setting_screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => MainScreen()),
  GetPage(name: "/favorite", page: () => FavoriteScreen()),
  GetPage(name: "/setting", page: () => ProfileScreen()),
  GetPage(name: "/onboarding", page: () => OnboardingPage()),
  GetPage(name: "/verification", page: () => VerificationScreen()),
  GetPage(name: "/create-account", page: () => CreateAccountScreen()),
  GetPage(name: "/profile", page: () => SettingsScreen()),
];
