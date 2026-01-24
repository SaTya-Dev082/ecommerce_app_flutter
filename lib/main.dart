// Main Master

import 'package:e_commerce_app/binding/home_binding.dart';
import 'package:e_commerce_app/constants/get_pages.dart';
import 'package:e_commerce_app/controller/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: StorageService.isLoggedIn ? "/" : "/onboarding",
      getPages: getPages,
    );
  }
}

// Test

/*
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          titleSpacing: 5,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpVNo2AcHT-8BxVLkxjpgGB_jTQtoyBfhjbQ&s",
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Jonathan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: kAppBarSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Let’s go shopping",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.indigo,
            labelColor: Colors.indigo,
            unselectedLabelColor: Colors.grey,
            tabs: [Tab(text: "Home"), Tab(text: "Category")],
          ),
        ),
        body: TabBarView(
          children: [
            _buildHomeContent(),
            _buildHomeContent(),
            // const Center(child: Text("Category Page")),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "My Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "My Profile",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Banner
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "24% off shipping today\non bag purchases",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "By Kutuku Store",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(
                    "https://i.pinimg.com/1200x/4d/a7/3f/4da73f313deef52c2373795a970b4082.jpg",
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// New Arrivals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "New Arrivals 🔥",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          /// New Arrivals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "New Arrivals 🔥",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          /// New Arrivals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "New Arrivals 🔥",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          /// New Arrivals
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "New Arrivals 🔥",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                  name: "The Mirac Jiz",
                  brand: "Lisa Robber",
                  price: "\$195.00",
                ),
                ProductCard(
                  image:
                      "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                  name: "Meriza Kiles",
                  brand: "Gazuna Resika",
                  price: "\$143.45",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String brand;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: kBackgroundCardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: Image.network(image, height: 90)),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
*/

/*
import 'package:e_commerce_app/constants/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AccountPage());
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // Account Block (scrollable)
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(radius: 30),
                      SizedBox(height: 12),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "john@example.com",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),

              // TabBar (scrolls together)
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: const TabBar(
                    labelColor: Colors.blue,
                    tabs: [Tab(text: "Posts"), Tab(text: "Likes")],
                  ),
                ),
              ),
            ];
          },

          // Tab contents (scrollable)
          body: TabBarView(
            children: [_buildHomeContent(), _buildHomeContent()],
          ),
        ),
      ),
    );
  }
}

Widget _buildHomeContent() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Banner
        Container(
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "24% off shipping today\non bag purchases",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "By Kutuku Store",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  "https://i.pinimg.com/1200x/4d/a7/3f/4da73f313deef52c2373795a970b4082.jpg",
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        /// New Arrivals
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "New Arrivals 🔥",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        /// New Arrivals
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "New Arrivals 🔥",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        /// New Arrivals
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "New Arrivals 🔥",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        /// New Arrivals
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "New Arrivals 🔥",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "See All",
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
                name: "The Mirac Jiz",
                brand: "Lisa Robber",
                price: "\$195.00",
              ),
              ProductCard(
                image:
                    "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
                name: "Meriza Kiles",
                brand: "Gazuna Resika",
                price: "\$143.45",
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String brand;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: kColorBackgroundCard,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(child: Image.network(image, height: 90)),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
*/
