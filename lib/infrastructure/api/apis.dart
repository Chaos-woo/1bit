import 'package:cw2bit/domain/bing/service/bing_mgr.dart';
import 'package:cw2bit/infrastructure/api/github/github_api.dart';
import 'package:cw2bit/public/ui/theme/themes.dart';
import 'package:get/get.dart';

final class Apis {
  static GithubApi github = GithubApi.singl;

  Apis._();

  /// 初始化所有API客户端
  static void create_apis() {
    Get.put(GithubApi(), tag: GithubApi.tag);
  }

  /// 初始化服务
  static void create_services() {
    Get.put(ThemesMgr(), tag: ThemesMgr.tag);
    Get.put(BingMgr(), tag: BingMgr.tag);
  }
}
