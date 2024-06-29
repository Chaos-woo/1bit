import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

final class GithubApi extends GetxService {
  static const String tag = '1bitRepoGithubApi';

  static GithubApi get singl => Get.find(tag: tag);

  late DioApi doClient;

  GithubApi() {
    doClient = DioApi(
      'https://api.github.com',
    );
  }
}
