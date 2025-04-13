import 'package:get/get.dart';

import 'logic.dart';

class GithubSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      var logic = GithubSettingLogic();
      var show_repo = GithubSettingLogic.m_path_variables.show_1bit_repo;
      logic.show_1bit_repository = bool.parse(show_repo ?? true.toString(), caseSensitive: false);
      return logic;
    });
  }
}
