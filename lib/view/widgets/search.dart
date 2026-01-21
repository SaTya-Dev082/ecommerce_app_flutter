import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();
  List<Product> products = allProducts;
  // final _keyForm = GlobalKey<FormState>();
  bool isFavorite = false;

  final List<String> searches = [
    'Electronics',
    'Pants',
    'Three Second',
    'Long shirt',
  ];

  String limitText(String text, [int maxLength = 20]) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.offAll(MainScreen());
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: kColorTextDark,
                    size: 28,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText(searchController.text);
                      });
                    },
                    style: TextStyle(
                      color: kColorTextDark,
                      fontSize: kSizeMedium,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search anythings here ...",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: kSizeMedium,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: kSizeAppBar,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        // borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Search',
                  style: TextStyle(
                    fontSize: kSizeMedium,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      searches.removeRange(0, searches.length);
                    });
                  },
                  child: Text(
                    'Clear All',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: kSizeVerySmall,
                    ),
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  searches.map((item) {
                    return Chip(
                      label: Text(item),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () {
                        setState(() {
                          searches.removeAt(1);
                        });
                      },
                      backgroundColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 14),
            Text(
              "Popular Search",
              style: TextStyle(
                fontSize: kSizeMedium,
                color: kColorTextDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    leading: Container(
                      height: Get.height * 0.1,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        color: kColorBackgroundCard,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text(
                      limitText(product.name),
                      style: TextStyle(
                        fontSize: kSizeSmall,
                        color: kColorTextDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      limitText(product.description, 25),
                      style: TextStyle(
                        fontSize: kSizeVerySmall,
                        color: kColorTextGrey,
                      ),
                    ),
                    trailing: SizedBox(
                      height: 40,
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Hot",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
  void searchText(String text) {
    final suggests =
        products.where((product) {
          final productTile = product.name.toLowerCase();
          final input = text.toLowerCase();
          return productTile.contains(input);
        }).toList();
    setState(() {
      products = suggests;
    });
  }
}

class Product {
  final String name;
  final String description;
  final bool isFavorite;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.isFavorite,
    required this.price,
    required this.imageUrl,
  });
}

List<Product> allProducts = [
  Product(
    name: "The Pizza fast food",
    description: "Popular for fast food everyone",
    price: 129.33,
    isFavorite: false,
    imageUrl:
        "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
  ),
  Product(
    name: "The Burger by Three Second",
    description: "Most popular fast food ever",
    price: 129.33,
    isFavorite: false,
    imageUrl:
        "https://i.pinimg.com/1200x/97/90/5f/97905fb9c665d37cd534eeb0f3516ef5.jpg",
  ),
  Product(
    name: "Cold Drink",
    description: "Have more energy with cold drink",
    price: 129.33,
    isFavorite: false,
    imageUrl:
        "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
  ),
  Product(
    name: "The Pizza Iueuwi sbvsidu ei hvb",
    description: "Popular for fast food everyone",
    price: 129.33,
    isFavorite: false,
    imageUrl:
        "https://i.pinimg.com/736x/bb/a5/c0/bba5c0ba97ee58886a213ae209b53b90.jpg",
  ),
  Product(
    name: "The Pizza Iueuwi sbvsidu ei hvb",
    description: "Popular for fast food everyone",
    price: 129.33,
    isFavorite: false,
    imageUrl:
        "https://i.pinimg.com/1200x/bc/0f/a8/bc0fa8ec0ae2461e06aaf19921eba2e6.jpg",
  ),
];
