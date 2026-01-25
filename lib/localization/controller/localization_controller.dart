import 'package:get/get.dart';

import '../languages/english.dart';
import '../languages/khmer.dart';

class AppLocalizationController extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"en": en, "kh": kh};
}
