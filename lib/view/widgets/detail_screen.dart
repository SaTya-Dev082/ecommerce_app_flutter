import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});
  final Product product;
  final ProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder:
          (controller) => Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
              title: Text(product.name!, style: TextStyle(color: Colors.black)),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Product Image
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.network(
                            "http://10.0.2.2:8000${product.imageUrl}",
                            // Replace with your image
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Product Details Container
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Name & Quantity
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      product.name!,
                                      style: TextStyle(
                                        fontSize: kSizeMedium,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                      ),
                                      Text(
                                        product.quantity.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Rating
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.8 (320 Reviews)',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              // Description
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: kSizeMedium,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.description!,
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 16),
                              // Price & Add to Cart Button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${product.price}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: kColorTextLight,
                                    ),
                                    label: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                        fontSize: kSizeSmall,
                                        fontWeight: FontWeight.bold,
                                        color: kColorTextLight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
