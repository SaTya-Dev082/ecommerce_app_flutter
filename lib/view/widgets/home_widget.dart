import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';

class buildItemView extends StatefulWidget {
  buildItemView({super.key});

  @override
  State<buildItemView> createState() => _buildItemViewState();
}

class _buildItemViewState extends State<buildItemView> {
  final ProductController controller = Get.find();

  String limitText(String text, [int maxLength = 20]) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  @override
  void initState() {
    super.initState();
    controller.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        // 1️⃣ Loading state
        if (controller.products.isEmpty) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // 2️⃣ Data loaded
        return SizedBox(
          height: 200,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 4),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return SizedBox(
                width: 180,
                child: GestureDetector(
                  onTap: () {
                    Get.to(ProductDetailScreen(product: product));
                  },
                  child: Card(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: "http://10.0.2.2:8000${product.imageUrl}",
                            height: 130,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                limitText(product.name!),
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
                          bottom: 14,
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
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
