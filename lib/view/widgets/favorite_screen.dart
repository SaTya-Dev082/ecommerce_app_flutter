import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/view/widgets/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ProductController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.fetchFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        backgroundColor: kColorBackground,
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(fontSize: kSizeAppBar, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.fetchFavorite();
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
                    return GestureDetector(
                      onTap: () {
                        Get.to(ProductDetailScreen(product: product));
                      },
                      child: Card(
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "http://10.0.2.2:8000${product.imageUrl!}",
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
                      ),
                    );
                  },
                ),
          ),
        ),
      ),
    );
  }
}
