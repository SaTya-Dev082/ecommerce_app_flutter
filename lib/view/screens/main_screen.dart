import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/view/screens/home_screen.dart';
import 'package:e_commerce_app/view/screens/my_card_screen.dart';
import 'package:e_commerce_app/view/screens/profile.dart';
import 'package:e_commerce_app/view/screens/cart_select_screen.dart';
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
                MyOrderScreen(),
                CartSummaryScreen(),
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
                  icon: Icon(Icons.directions_car),
                  activeIcon: Icon(Icons.directions_car_filled),
                  label: "My Order",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: "Card",
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
