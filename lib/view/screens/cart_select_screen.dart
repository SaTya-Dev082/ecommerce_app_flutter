import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartSummaryScreen extends StatefulWidget {
  const CartSummaryScreen({super.key});

  @override
  State<CartSummaryScreen> createState() => _CartSummaryScreenState();
}

class _CartSummaryScreenState extends State<CartSummaryScreen> {
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(FavoriteScreen());
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return controller.fetchCartProduct();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<CartController>(
            builder: (controller) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.cartItems.isEmpty) {
                return const Center(child: Text("Cart is empty"));
              }

              return ListView.separated(
                itemCount: controller.cartItems.length,
                separatorBuilder:
                    (BuildContext context, int index) => SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final product = controller.cartItems[index]; // safe now
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 100,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Row(
                          spacing: 7,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "https://i.pinimg.com/736x/40/73/df/4073df3aaaac8380be1a570d269bb069.jpg",
                                // "http://10.0.2.2:8000${product.product.imageUrl}",
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 6,
                              children: [
                                Text(
                                  limitedText(product.product.name ?? ""),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  limitedText(product.product.description!),
                                  style: TextStyle(fontSize: 16),
                                ),
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 16,
                                        ),
                                        onPressed: () {
                                          if (product.quantity > 1) {
                                            setState(() {
                                              controller.decreaseQuantity(
                                                product,
                                              );
                                            });
                                          }
                                        },
                                      ),
                                      Text('${product.quantity}'),
                                      IconButton(
                                        icon: const Icon(Icons.add, size: 16),
                                        onPressed: () {
                                          setState(() {
                                            controller.increaseQuantity(
                                              product,
                                            );
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 15,
                          child: Text(
                            '\$${product.product.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: GetBuilder<CartController>(
                  builder:
                      (controller) => ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            kColorPrimary,
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            kColorTextLight,
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: kColorTextLight,
                            isDismissible: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              final total = controller.getTotalPrice(
                                controller.cartItems,
                              );
                              return SizedBox(
                                height: 400,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12,
                                        right: 12,
                                        left: 12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            "Quantity",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            "Price",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 250,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: ListView.separated(
                                          separatorBuilder:
                                              (context, index) => Divider(),
                                          itemCount:
                                              controller.cartItems.length,
                                          itemBuilder: (context, index) {
                                            final data =
                                                controller.cartItems[index];
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("${data.product.name}"),
                                                Center(
                                                  child: Text(
                                                    data.quantity.toString(),
                                                  ),
                                                ),
                                                Text(data.product.price!),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8,
                                        left: 12,
                                        right: 12,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0XFFd3f8fa),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "\$ ${total.toStringAsFixed(2)}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Expanded(
                                            child: SizedBox(
                                              height: 50,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                        kColorPrimary,
                                                      ),
                                                  foregroundColor:
                                                      WidgetStatePropertyAll(
                                                        kColorTextLight,
                                                      ),
                                                ),
                                                onPressed: () {
                                                  final total = controller
                                                      .getTotalPrice(
                                                        controller.cartItems,
                                                      );
                                                  print(
                                                    "\$${total.toStringAsFixed(2)}",
                                                  );
                                                },
                                                child: Text(
                                                  "Pay Now",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Checkout", style: TextStyle(fontSize: 18)),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  String limitedText(String title, [int i = 20]) {
    return title.length <= i ? title : '${title.substring(0, i)}...';
  }
}
