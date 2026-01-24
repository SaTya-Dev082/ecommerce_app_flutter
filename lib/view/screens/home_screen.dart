import 'dart:async' show Timer;

import 'package:e_commerce_app/controller/authentication_controller.dart';
import 'package:e_commerce_app/controller/category_controller.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/view/screens/favorite_screen.dart';
import 'package:e_commerce_app/view/widgets/all_products.dart';
import 'package:e_commerce_app/view/widgets/category_widget.dart';
import 'package:e_commerce_app/view/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constant.dart';
import '../widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  final CategoryController controller = Get.find();
  final ProductController productController = Get.find();
  final AuthenticationController authController = Get.find();
  bool isFavorite = false;
  final List<Map<String, String>> banners = [
    {
      "url": "assets/images/page_banners/iphone.png",
      "title":
          "Experience speed, style, and innovation with iPhone’s sleek design and smooth performance.",
      "subtitle": "Up to 50% off",
    },
    {
      "url": "assets/images/page_banners/btk.png",
      "title":
          "Lightweight and comfortable jersey, perfect for sports and everyday wear.",
      "subtitle": "Trending now",
    },
    {
      "url": "assets/images/page_banners/mac.png",
      "title":
          "Mac delivers powerful performance, a stunning display, and a sleek design for everyday work.",
      "subtitle": "Trending now",
    },
    {
      "url": "assets/images/page_banners/jacket.png",
      "title":
          "Comfortable and durable jacket, ideal for daily wear and cool weather.",
      "subtitle": "Trending now",
    },
    {
      "url": "assets/images/page_banners/shoe.png",
      "title": "Comfortable and durable shoes designed for everyday wear.",
      "subtitle": "Trending now",
    },
  ];

  int currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startAutoSlide();
  }

  void startAutoSlide() {
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (currentPage < banners.length - 1) {
        currentPage++;

        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // last page → jump to first WITHOUT animation
        currentPage = 0;
        pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        animationDuration: Duration(milliseconds: 500),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingSmall),
          child: Scaffold(
            backgroundColor: kColorBackground,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  // Account Block (scrollable)
                  SliverToBoxAdapter(
                    child: Obx(() {
                      final user = authController.currentUser.value;

                      if (user == null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return blockProfileHome(
                        imagePath: "http://10.0.2.2:8000${user.avatar}",
                        username: user.name!,
                      );
                    }),
                  ),

                  // TabBar (scrolls together)
                  SliverToBoxAdapter(
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: kColorPrimary,
                      dividerHeight: 3,
                      indicatorColor: kColorPrimary,
                      dividerColor: kColorTextGrey,
                      indicatorWeight: 3,
                      labelStyle: TextStyle(fontSize: kSizeSmall),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3, color: kColorPrimary),
                        insets: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      unselectedLabelColor: kColorTextGrey,
                      tabs: [Tab(text: "Home"), Tab(text: "Category")],
                    ),
                  ),
                ];
              },

              // Tab contents (scrollable)
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TabBarView(
                  children: [_buildHomeContent(), CategoryWidget()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget blockProfileHome({
    required String imagePath,
    required String username,
  }) {
    return Row(
      spacing: 10,
      children: [
        CircleAvatar(
          backgroundColor: Colors.brown,
          backgroundImage: NetworkImage(imagePath),
          radius: 35,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, $username",
              style: TextStyle(
                fontSize: kSizeLarge,
                color: kColorTextDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Enjoy your time",
              style: TextStyle(fontSize: kSizeSmall, color: kColorTextGrey),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            Get.to(Search());
          },
          icon: Icon(Icons.search, size: 30, color: kColorTextDark),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: kColorTextDark,
          ),
        ),
      ],
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Banner
          Stack(
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: banners.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return buildBanner(
                      url: banner["url"]!,
                      title: banner["title"]!,
                      subtitle: banner["subtitle"]!,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 16,
                left: 190,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: banners.length,
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
            ],
          ),

          const SizedBox(height: 8),

          /// New Arrivals
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Products",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(AllProductsScreen());
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: kSizeSmall,
                          color: kColorPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                buildItemView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBanner({
    required String url,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2FF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: kSizeSmall,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(subtitle, style: TextStyle(color: kColorTextGrey)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  url,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
