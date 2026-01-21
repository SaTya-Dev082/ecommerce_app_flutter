import 'package:e_commerce_app/controller/category_controller.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
  }
}
