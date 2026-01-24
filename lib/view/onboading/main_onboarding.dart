import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/view/onboading/first_screen.dart';
import 'package:e_commerce_app/view/onboading/second_screen.dart';
import 'package:e_commerce_app/view/onboading/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();
  int currentPage = 0;
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            controller: pageController,
            children: const [
              OnboardingScreenOne(),
              OnboardingScreenTwo(),
              OnboardingScreenThree(),
            ],
          ),
        ),

        bottomSheet:
            isLastPage
                ? SizedBox()
                : Container(
                  height: 82,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  // decoration: BoxDecoration(color: kColorPrimary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          pageController.jumpToPage(2);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(fontSize: kSizeMedium),
                        ),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 2 + 1,
                          effect: WormEffect(
                            activeDotColor: kColorPrimary,
                            dotColor: kColorTextGrey,
                            spacing: 5,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                          onDotClicked:
                              (index) => pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn,
                              ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: kSizeMedium,
                            color: kColorPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
