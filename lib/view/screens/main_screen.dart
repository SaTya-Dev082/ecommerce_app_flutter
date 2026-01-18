import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/view/screens/favorite_screen.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/my_card_screen.dart';
import 'package:e_commerce_app/view/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final HomeController controller = Get.find();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:
          (controller) => Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: (index) {
                controller.changeBottomIndex(index: index);
              },
              children: [
                HomeScreen(),
                MyCardScreen(),
                FavoriteScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              selectedItemColor: Color(0XFF514EB6),
              backgroundColor: kColorBackground,
              iconSize: 25,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.changeBottomIndex(index: index);
                pageController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.delivery_dining_outlined),
                  activeIcon: Icon(Icons.delivery_dining),
                  label: "My Order",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  activeIcon: Icon(Icons.favorite),
                  label: "Favorite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined),
                  activeIcon: Icon(Icons.person),
                  label: "My Profile",
                ),
              ],
            ),
          ),
    );
  }
}
