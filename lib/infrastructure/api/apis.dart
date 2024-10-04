import 'package:cw2bit/infrastructure/api/github/github_api.dart';
import 'package:get/get.dart';

final class Apis {
  static GithubApi github = GithubApi.singl;

  Apis._();

  /// 初始化所有API客户端
  static void createApis() {
    Get.put(GithubApi(), tag: GithubApi.tag);
  }
}
