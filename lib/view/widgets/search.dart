import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
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

  final ProductController controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
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
                  size: 26,
                ),
              ),
              Form(
                key: _keyForm,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        controller.searchProducts(value);
                      },
                      style: TextStyle(
                        color: kColorTextDark,
                        fontSize: kSizeMedium,
                      ),

                      decoration: InputDecoration(
                        hintText: "Search name,description, ...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: kSizeSmall,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            searchController.clear();
                          },
                          icon: Icon(Icons.clear),
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
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  searches.map((item) {
                    return Chip(
                      label: Text(item),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () {
                        setState(() {
                          searches.remove(item);
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
          ),
          SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Popular Search",
              style: TextStyle(
                fontSize: kSizeMedium,
                color: kColorTextDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 14),
          GetBuilder<ProductController>(
            builder:
                (controller) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: controller.searchProductData.length,
                      itemBuilder: (context, index) {
                        final product = controller.searchProductData[index];
                        return ListTile(
                          onTap: () {
                            Get.to(ProductDetailScreen(product: product));
                          },
                          selected: true,
                          // selectedTileColor: Colors.blue.shade100,
                          leading: Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.2,
                            decoration: BoxDecoration(
                              color: kColorBackgroundCard,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "http://10.0.2.2:8000${product.imageUrl!}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          title: Text(
                            limitText(product.name!),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: kSizeSmall,
                              color: kColorTextDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            limitText(product.description!, 25),
                            maxLines: 2,
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
                ),
          ),
        ],
      ),
    ),
  );
}
