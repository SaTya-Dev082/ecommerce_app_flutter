import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  bool isFavorite = false;
  final List<Map<String, String>> banners = [
    {
      "url": "assets/images/page_banners/iphone.png",
      "title": "🔴 LIVE | SWISS STAGE ថ្ងៃទី 7 | M7 World Championship | (KH)",
      "subtitle": "Up to 50% off",
    },
    {
      "url": "assets/images/page_banners/btk.png",
      "title": "🔴 LIVE | SWISS STAGE ថ្ងៃទី 7 | M7 World Championship | (KH)",
      "subtitle": "Trending now",
    },
    {
      "url": "assets/images/page_banners/mac.png",
      "title": "🔴 LIVE | SWISS STAGE ថ្ងៃទី 7 | M7 World Championship | (KH)",
      "subtitle": "Trending now",
    },
    {
      "url": "assets/images/page_banners/jacket.png",
      "title": "🔴 LIVE | SWISS STAGE ថ្ងៃទី 7 | M7 World Championship | (KH)",
      "subtitle": "Trending now",
    },
    {
      "url": "assets/images/page_banners/shoe.png",
      "title": "🔴 LIVE | SWISS STAGE ថ្ងៃទី 7 | M7 World Championship | (KH)",
      "subtitle": "Trending now",
    },
  ];

  final List<Map<String, dynamic>> products = [
    {
      "name": "The Pizza Iueuwi sbvsidu ei hvb",
      "description": "Popular for fast food everyone",
      "price": 129.33,
      "isFavorite": false,
      "image_url":
          "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
    },
    {
      "name": "The Pizza",
      "description": "Popular for fast food everyone",
      "price": 129.33,
      "isFavorite": false,
      "image_url":
          "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
    },
    {
      "name": "The Pizza",
      "description": "Popular for fast food everyone",
      "price": 129.33,
      "isFavorite": true,
      "image_url":
          "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
    },
    {
      "name": "The Pizza",
      "description": "Popular for fast food everyone",
      "price": 129.33,
      "isFavorite": false,
      "image_url":
          "https://i.pinimg.com/736x/bb/a5/c0/bba5c0ba97ee58886a213ae209b53b90.jpg",
    },
    {
      "name": "The Pizza",
      "description": "Popular for fast food everyone",
      "price": 129.33,
      "isFavorite": true,
      "image_url":
          "https://i.pinimg.com/736x/95/6c/2d/956c2d149487411b749be8cc06f35eab.jpg",
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Shoes",
      "count": 123,
      "image_url":
          "https://i.pinimg.com/1200x/ff/2a/49/ff2a497111626cdf1bbd16edeab19bd3.jpg",
    },
    {
      "name": "Web Cam",
      "count": 153,
      "image_url":
          "https://i.pinimg.com/736x/41/13/69/411369df2c54c384b173fbb210de838f.jpg",
    },
    {
      "name": "Coconut",
      "count": 111,
      "image_url":
          "https://i.pinimg.com/1200x/27/6d/d4/276dd49787cf64a61a64d808ee76d974.jpg",
    },
    {
      "name": "Avocado",
      "count": 125,
      "image_url":
          "https://i.pinimg.com/736x/79/3b/06/793b0666492baea91947c0680b75dcfa.jpg",
    },
    {
      "name": "Fruits",
      "count": 100,
      "image_url":
          "https://i.pinimg.com/736x/93/90/e6/9390e6cd144f89705ab95dcb0c60fb41.jpg",
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
                    child: blockProfileHome(
                      imagePath:
                          "https://avatars.githubusercontent.com/u/463230?v=4",
                      username: "SaTya",
                    ),
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
                  children: [_buildHomeContent(), buildItemCategory()],
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
            print("Search");
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

          const SizedBox(height: 16),

          /// New Arrivals
          buildItemView(
            title: "New Arrivals 🔥",
            onPressed: () {
              print("See All");
            },
          ),
          const SizedBox(height: 16),

          /// New Arrivals
          buildItemView(
            title: "Most Popular 🔥",
            onPressed: () {
              print("See All");
            },
          ),
        ],
      ),
    );
  }

  String limitText(String text, [int maxLength = 20]) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  Widget buildItemView({
    required String title,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: onPressed,
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

        const SizedBox(height: 8),

        SizedBox(
          height: 250,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8); // space between items
            },
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                color: kColorBackgroundCard,
                child: SizedBox(
                  height: 250,
                  width: 200,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: Stack(
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                color: kColorBackgroundCard,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Image.network(
                                  product["image_url"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                height: 43,
                                width: 43,
                                decoration: BoxDecoration(
                                  color: kColorTextGrey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isFavorite = !isFavorite;
                                      });
                                    },
                                    icon: Icon(
                                      product["isFavorite"]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 30,
                                      color: kColorPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  limitText(product["name"], 18),
                                  style: TextStyle(
                                    fontSize: kSizeMedium,
                                    color: kColorTextDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  limitText(product["description"]),
                                  style: TextStyle(
                                    fontSize: kSizeSmall,
                                    color: kColorTextGrey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$ ${product["price"]}",
                                  style: TextStyle(
                                    fontSize: kSizeMedium,
                                    color: kColorTextDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryImage(String image, {required bool isLeft}) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: isLeft ? const Radius.circular(16) : Radius.zero,
        right: !isLeft ? const Radius.circular(16) : Radius.zero,
      ),
      child: Image.network(
        image,
        width: 250,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _categoryText(String title, int count) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "$count Products",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _imageLeftTextRight(Map<String, dynamic> item) {
    return [
      _categoryImage(item["image_url"]!, isLeft: true),
      _categoryText(item["name"]!, item["count"]!),
    ];
  }

  List<Widget> _textLeftImageRight(Map<String, dynamic> item) {
    return [
      _categoryText(item["name"]!, item["count"]!),
      _categoryImage(item["image_url"]!, isLeft: false),
    ];
  }

  Widget buildItemCategory() {
    return ListView.separated(
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        final item = categories[index];
        final isEven = index % 2 == 0;

        return GestureDetector(
          onTap: () {
            print(item["name"]);
          },
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: kColorBackgroundCard,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children:
                  isEven
                      ? _imageLeftTextRight(item)
                      : _textLeftImageRight(item),
            ),
          ),
        );
      },
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
