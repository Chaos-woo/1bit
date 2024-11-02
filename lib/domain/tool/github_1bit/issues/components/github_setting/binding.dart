import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class GithubSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      var logic = GithubSettingLogic();
      var show_repo = QKit.route.path_variables(GithubSettingLogic.c_rt_path_show_1bit_repo);
      logic.show_1bit_repository = bool.parse(show_repo ?? 'true', caseSensitive: false);
      return logic;
    });
  }
}
