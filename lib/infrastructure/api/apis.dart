
import 'package:cw2bit/infrastructure/api/github/github_api.dart';
import 'package:get/get.dart';

final class Apis {
  static GithubApi github = GithubApi.singl;

  /// 初始化所有API客户端
  static void initApis() {
    Get.put(GithubApi(), tag: GithubApi.tag);
  }
}