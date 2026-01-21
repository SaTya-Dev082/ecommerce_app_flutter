import 'package:flutter/material.dart';

import 'onboarding_template.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      image:
          'https://i.pinimg.com/736x/44/76/95/4476950bf99b7e2fbe876d2559cc96ee.jpg',
      title: 'Various Collections Of The Latest Products',
      description:
          'Una amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    );
  }
}
