import 'package:get/get.dart';

import 'logic.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageLogic());
  }
}
