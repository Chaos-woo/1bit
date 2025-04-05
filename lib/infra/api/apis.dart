import 'package:cw2bit/modules/app_hot_search/service/hot_search_config_mgr.dart';
import 'package:cw2bit/modules/app_hot_search/service/hot_search_mgr.dart';
import 'package:cw2bit/modules/github/services/github_mgr.dart';
import 'package:cw2bit/modules/microsoft_bing/service/bing_mgr.dart';
import 'package:cw2bit/infrastructure/api/github/github_api.dart';
import 'package:cw2bit/public/ui/theme/themes.dart';
import 'package:get/get.dart';

final class Apis {
  static GithubApi github = GithubApi.getx;

  Apis._();

  /// 初始化所有API客户端
  static void create_apis() {
    Get.put(GithubApi(), tag: GithubApi._getxTag);
  }

  /// 初始化服务
  static void create_services() {
    Get.put(ThemesMgr(), tag: ThemesMgr._getxTag);
    Get.put(BingMgr(), tag: BingMgr.getx_tag);
    Get.put(HotSearchConfigMgr(), tag: HotSearchConfigMgr.getx_tag);
    Get.put(HotSearchMgr(), tag: HotSearchMgr.getx_tag);
    Get.put(GithubMgr(), tag: GithubMgr.getx_tag);
  }
}
