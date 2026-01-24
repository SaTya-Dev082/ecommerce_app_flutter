import 'package:flutter/material.dart';

import 'onboarding_template.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingTemplate(
      image:
          'https://i.pinimg.com/736x/2f/51/32/2f51321f8c3ef3d62670c2892f89700c.jpg',
      title: 'Complete Collection Of Colors And Sizes',
      description:
          'Una amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    );
  }
}
