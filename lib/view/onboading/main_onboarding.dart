import 'package:e_commerce_app/view/onboading/first_screen.dart';
import 'package:e_commerce_app/view/onboading/second_screen.dart';
import 'package:e_commerce_app/view/onboading/third_screen.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          OnboardingScreenOne(),
          OnboardingScreenTwo(),
          OnboardingScreenThree(),
        ],
      ),
    );
  }
}
