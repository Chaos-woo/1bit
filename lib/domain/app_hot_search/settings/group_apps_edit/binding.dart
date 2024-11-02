import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppHotSearchGroupAppsBinding extends Bindings {
  @override
  void dependencies() {
    var group = QKit.route.argument() as FavoriteAppGroup;
    Get.lazyPut(() {
      var logic = AppHotSearchGroupAppsEditLogic();
      logic.group = group;
      return logic;
    }, tag: AppHotSearchGroupAppsEditLogic.tag_format(QKit.route.path_variables('group_id')!));
  }
}
