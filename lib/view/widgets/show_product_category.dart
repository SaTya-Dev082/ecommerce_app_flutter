import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';

class ShowProductCategory extends StatefulWidget {
  ShowProductCategory({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });
  final int categoryId;
  final String categoryName;

  @override
  State<ShowProductCategory> createState() => _ShowProductCategoryState();
}

class _ShowProductCategoryState extends State<ShowProductCategory> {
  final ProductController controller = Get.find();

  // final CategoryController categoryController = Get.find();
  @override
  void initState() {
    super.initState();
    controller.getProductByCategoryId(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getProductByCategoryId(widget.categoryId);
        },
        child: GetBuilder<ProductController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.products.isEmpty) {
              return const Center(child: Text("No products"));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      IgnorePointer(
                        child: CachedNetworkImage(
                          imageUrl: "http://10.0.2.2:8000${product.imageUrl!}",
                          height: 130,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
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
            );
          },
        ),
      ),
    );
  }
}
