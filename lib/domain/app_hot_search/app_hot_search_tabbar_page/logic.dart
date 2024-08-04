import 'package:cw2bit/domain/app_hot_search/app_hot_search_tabbar_page/components/app_hot_search_list/logic.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:get/get.dart';

import 'state.dart';

class AppHotSearchTabbarPageLogic extends GetxController {
  final AppHotSearchTabbarPageState state = AppHotSearchTabbarPageState();

  final k_app_scroll_view_view_id = '#kAppScrollView';

  @override
  void onReady() async {
    super.onReady();

    await fetch_app_list();
  }

  Future<void> fetch_app_list() async {
    List<GithubContent> contents =
        await Apis.github.list_contents(c_hot_search_repo_owner, c_hot_search_repo, 'archives');
    List<String> apps = contents
        .where((content) => GithubContentTypeEnum.dir == content.type)
        .map((content) => content.name)
        .toList();
    state.apps = apps;
    update([k_app_scroll_view_view_id]);
  }

  void update_select_app(String app) {
    AppHotSearchListLogic list_logic = Get.find<AppHotSearchListLogic>();
    if (list_logic.fetching_hot_search) {
      return;
    }

    state.app = app;
    update([k_app_scroll_view_view_id]);
    list_logic.update_hot_search_app(state.app);
  }
}
