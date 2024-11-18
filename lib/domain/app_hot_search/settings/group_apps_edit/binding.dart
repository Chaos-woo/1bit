import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppHotSearchGroupAppsBinding extends Bindings {
  @override
  void dependencies() {
    var group = q0_.route.argument() as HotSearchGroup;
    Get.lazyPut(() {
      var logic = AppHotSearchGroupAppsEditLogic();
      logic.group = group;
      return logic;
    },
        tag: AppHotSearchGroupAppsEditLogic.getx_tag_format(
            AppHotSearchGroupAppsEditLogic.m_path_variables.path_k_group_id));
  }
}
