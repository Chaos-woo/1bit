import 'package:cw2bit/domain/app_homepage/text_homepage/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageLogic());
    Get.lazyPut(() => TextbookHomepageLogic());
  }
}
