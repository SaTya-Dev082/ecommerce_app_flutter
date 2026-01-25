import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui';

class LocaleService {
  static final _box = GetStorage();
  static const _key = 'locale';

  static Locale getLocale() {
    final locale = _box.read(_key);
    if (locale != null) {
      final parts = locale.split('_');
      return Locale(parts[0], parts[1]);
    }
    return Get.deviceLocale ?? const Locale('en', 'US');
  }

  static void saveLocale(Locale locale) {
    _box.write(_key, '${locale.languageCode}_${locale.countryCode}');
    Get.updateLocale(locale);
  }
}
