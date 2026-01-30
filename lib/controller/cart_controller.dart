import 'dart:convert';

import 'package:e_commerce_app/constants/url.dart';
import 'package:e_commerce_app/controller/storage_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/cart_item_model.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  List<CartItem> cartItems = [];
  bool isLoading = false;
  final token = StorageService.token;

  // Fetch product cart
  Future<void> fetchCartProduct() async {
    try {
      isLoading = true;
      update();

      final response = await http.get(
        Uri.parse("$baseUrl/cart-item"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final List items = body["cartItems"];
        cartItems = items.map((item) => CartItem.fromJson(item)).toList();
      } else {
        Get.snackbar("Error", "Error fetch cart product");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> addToCart(int product_id) async {
    try {
      isLoading = true;
      update();

      final response = await http.post(
        Uri.parse("$baseUrl/cart-item/$product_id"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final List items = body["cartItems"];
        cartItems = items.map((item) => CartItem.fromJson(item)).toList();
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading = false;
      update();
    }
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
  }

  double getTotalPrice(List<CartItem> items) {
    return items.fold(0.0, (total, item) {
      double productPrice = double.parse(item.product.price.toString());
      return total + (productPrice * item.quantity);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCartProduct();
  }
}
