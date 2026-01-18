import 'package:e_commerce_app/view/screens/favorite_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/screens/profile.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => MainScreen()),
  GetPage(name: "/favorite", page: () => FavoriteScreen()),
  GetPage(name: "/setting", page: () => ProfileScreen()),
  // GetPage(name: "/favorite", page: () => FavoriteScreen()),
];
