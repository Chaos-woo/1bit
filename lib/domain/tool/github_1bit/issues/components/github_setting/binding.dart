import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class GithubSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      var logic = GithubSettingLogic();
      bool? show1bitRepository = QKit.route.argument();
      logic.show1bitRepository = show1bitRepository;
      return logic;
    });
  }
}
