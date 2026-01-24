import 'package:e_commerce_app/view/authentication/create_account_screen.dart';
import 'package:e_commerce_app/view/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import 'onboarding_template.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingTemplate(
          image:
              'https://i.pinimg.com/736x/54/d2/2e/54d22e586eaff7879e91a1f8a4b2ce36.jpg',
          title: 'Find The Most Suitable Outfit For You',
          description:
              'Una amet, suspense perambulator ac elit diam facilitates curses vestibule.',
        ),
        SizedBox(height: 70),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              backgroundColor: WidgetStatePropertyAll(kColorPrimary),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            onPressed: () {
              Get.offAll(CreateAccountScreen());
            },
            child: Text(
              "Create Account",
              style: TextStyle(
                fontSize: kSizeMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFFFEF7FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: kColorTextGrey),
              ),
            ),
            onPressed: () {
              Get.offAll(LoginScreen());
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: kSizeMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
