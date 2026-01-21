import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../controller/category_controller.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final CategoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.fetchCategories();
      },

      child: GetBuilder<CategoryController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              bool isEven = index % 2 == 0;
              final category = controller.categories[index];

              return GestureDetector(
                onTap: () {
                  print(category.name);
                },
                child: Container(
                  height: 140, // ❗ Stack MUST have height
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: kColorTextGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      // Image
                      Align(
                        alignment:
                            isEven
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                        child: SizedBox(
                          width: 250,
                          height: 140,
                          child: CachedNetworkImage(
                            imageUrl:
                                "http://10.0.2.2:8000${category.imageUrl!}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Text
                      Align(
                        alignment:
                            isEven
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            category.name!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
