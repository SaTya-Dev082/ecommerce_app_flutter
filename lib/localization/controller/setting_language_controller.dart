import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui';

class SettingsController extends GetxController {
  final _box = GetStorage();
  final _key = 'locale';

  late Rx<Locale> currentLocale;

  @override
  void onInit() {
    final saved = _box.read(_key);
    if (saved != null) {
      final parts = saved.split('_');
      currentLocale = Locale(parts[0], parts[1]).obs;
    } else {
      currentLocale = const Locale('en').obs;
    }
    super.onInit();
  }

  void changeLanguage(Locale locale) {
    currentLocale.value = locale;
    _box.write(_key, '${locale.languageCode}_${locale.countryCode}');
    Get.updateLocale(locale);
  }
}
