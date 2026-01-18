import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  // BottomNavigationBar
  var currentIndex = 0;
  void changeBottomIndex({required int index}) {
    currentIndex = index;
    update();
  }

  // Block Theme Mode
  bool isDarkMode = false;
  void setThemeMode(bool value) {
    var theme = Get.isDarkMode;
    if (theme) {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
      isDarkMode = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
      isDarkMode = true;
    }
    update();
  }

  IconButton changeIconTheme(bool value) {
    String? theme = box.read("theme");
    return IconButton(
      onPressed: () {
        setThemeMode(value);
      },
      icon: Icon(
        theme == "dark" ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    isDarkMode = box.read("theme") == "dark";
  }
}
