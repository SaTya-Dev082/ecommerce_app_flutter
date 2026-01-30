// Main Master

import 'package:e_commerce_app/binding/home_binding.dart';
import 'package:e_commerce_app/constants/get_pages.dart';
import 'package:e_commerce_app/controller/storage_service.dart';
import 'package:e_commerce_app/view/screens/cart_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: StorageService.isLoggedIn ? "/" : "/onboarding",
      getPages: getPages,
    );
  }
}
