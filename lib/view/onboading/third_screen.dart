import 'package:flutter/material.dart';

import 'onboarding_template.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      image:
          'https://i.pinimg.com/736x/54/d2/2e/54d22e586eaff7879e91a1f8a4b2ce36.jpg',
      title: 'Find The Most Suitable Outfit For You',
      description:
          'Una amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    );
  }
}
