import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

final class GithubApi extends GetxService {
  static const String tag = '1bitRepoGithubApi';

  static GithubApi get singl => Get.find(tag: tag);

  late DioClientKit _api;

  GithubApi() {
    _api = DioClientKit(
      'https://api.github.com',
    );
  }
}
