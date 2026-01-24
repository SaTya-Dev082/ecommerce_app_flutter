import 'dart:convert';

import 'package:e_commerce_app/constants/url.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  bool isLoading = false;
  List<Categories> categories = [];

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading = true;

      final url = Uri.parse("$baseUrl/category");
      final response = await http.get(
        url,
        headers: {"Accept": "application/json"},
      );

      if (response.statusCode == 200) {
        final jsonCategory = jsonDecode(response.body)["categories"].toList();
        print(json);

        // Assign list
        categories = List.from(jsonCategory.map((e) => Categories.fromJson(e)));
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
}
