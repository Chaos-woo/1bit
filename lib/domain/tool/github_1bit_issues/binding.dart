import 'package:get/get.dart';

import 'logic.dart';

class Github1bitIssuesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Github1bitIssuesLogic());
  }
}
