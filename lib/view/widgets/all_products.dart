import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final ProductController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorBackground,
        title: Text(
          "Product",
          style: TextStyle(fontSize: kSizeAppBar, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchProducts();
        },
        child: GetBuilder<ProductController>(
          builder:
              (controller) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return Card(
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "http://10.0.2.2:8000${product.imageUrl!}",
                          height: 130,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name!,
                                style: TextStyle(
                                  fontSize: kSizeMedium,
                                  color: kColorPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "\$${product.price}",
                                style: TextStyle(
                                  fontSize: kSizeSmall,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 7,
                          top: 5,
                          child: GestureDetector(
                            onTap: () {
                              controller.toggleFavorite(product.id!);
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: kColorTextGrey,
                              child: Icon(
                                product.status == "favorite"
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: kColorPrimary,
                                size: 26,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}
