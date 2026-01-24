import 'dart:convert';
import 'package:e_commerce_app/constants/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  bool isLoading = false;

  /// Fetch all products
  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      Uri url = Uri.parse("$baseUrl/products");
      final response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["products"];
        final jsonProduct = data.toList();
        products = List.from(jsonProduct.map((e) => Product.fromJson(e)));
      } else {
        Get.snackbar("Error", "Status: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading = false;
    }
    update();
  }

  /// Fetch favorite products
  Future<void> fetchFavorite() async {
    try {
      isLoading = true;
      Uri url = Uri.parse("$baseUrl/product/favorites");
      final response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["products"];
        final jsonProduct = jsonDecode(response.body)["products"].toList();
        products = List.from(jsonProduct.map((e) => Product.fromJson(e)));
      } else {
        Get.snackbar("Error", "Status: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading = false;
    }
    update();
  }

  /// Toggle Favorite
  Future<void> toggleFavorite(int productId) async {
    final index = products.indexWhere((p) => p.id == productId);
    if (index == -1) return;

    final product = products[index];
    final oldStatus = product.status;

    // optimistic update
    product.status = oldStatus == "favorite" ? "unfavorite" : "favorite";

    update(); // 🔑 GetBuilder rebuild

    try {
      final url = Uri.parse("$baseUrl/toggle/$productId/favorite");
      final response = await http.get(url);

      if (response.statusCode != 200) {
        product.status = oldStatus;
        update();
      }
    } catch (e) {
      product.status = oldStatus;
      update();
    }
  }

  /// Get product by Category ID
  Future<void> getProductByCategoryId(int categoryId) async {
    try {
      isLoading = true;
      update();
      Uri url = Uri.parse("$baseUrl/category/$categoryId/products");
      final response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["products"];
        print(data);
        products = List.from(data.map((e) => Product.fromJson(e)).toList());
      } else {
        Get.snackbar("Error", "Status: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  List<Product> searchProductData = [];

  /// Search products

  Future<void> searchProducts(String query) async {
    try {
      isLoading = true;
      update();
      Uri url = Uri.parse("$baseUrl/product/search/$query");
      final response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["products"];
        searchProductData = List.from(
          data.map((e) => Product.fromJson(e)).toList(),
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
    fetchFavorite();
  }
}
