import 'package:get/get.dart';

import 'logic.dart';

class ToolQuickAccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ToolQuickAccessLogic());
  }
}
