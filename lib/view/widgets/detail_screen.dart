import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../screens/cart_select_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductController productController = Get.find();
  final CartController cartController = Get.find();
  final HomeController homeController = Get.find();

  int quantity = 1;

  double price = 8.2;

  double amount = 0.0;

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
                GetBuilder<HomeController>(
                  builder:
                      (controller) => IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.currentIndex = 0;
                          Get.offAll(MainScreen());
                        },
                      ),
                ),
              ],
              title: Text(
                widget.product.name!,
                style: TextStyle(color: Colors.black),
              ),
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
                            "http://10.0.2.2:8000${widget.product.imageUrl}",
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
                                      widget.product.name!,
                                      style: TextStyle(
                                        fontSize: kSizeMedium,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity >= 1) {
                                              quantity--;
                                            } else {
                                              quantity = 0;
                                            }
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.blue,
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
                                widget.product.description!,
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 16),
                              // Price & Add to Cart Button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${widget.product.price}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GetBuilder<CartController>(
                                    builder:
                                        (controller) => ElevatedButton.icon(
                                          onPressed: () {
                                            controller.addToCart(
                                              widget.product.id!,
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepPurple,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          icon: Icon(
                                            Icons.shopping_cart_outlined,
                                            color: kColorTextLight,
                                          ),
                                          label:
                                          // Text(
                                          //   'Total amount',
                                          //   style: TextStyle(
                                          //     fontSize: kSizeSmall,
                                          //     fontWeight: FontWeight.bold,
                                          //     color: kColorTextLight,
                                          //   ),
                                          // ),
                                          Text(
                                            'Add to Cart',
                                            style: TextStyle(
                                              fontSize: kSizeSmall,
                                              fontWeight: FontWeight.bold,
                                              color: kColorTextLight,
                                            ),
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

  totalAmount(int quantity, String price) {
    double priceDouble = double.parse(price);
    amount = priceDouble * quantity;
    return amount;
  }
}
