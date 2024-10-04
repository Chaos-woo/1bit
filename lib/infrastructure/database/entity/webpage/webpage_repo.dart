import 'package:get/get.dart';

/// 网页相关的仓库
final class WebpageRepo extends GetxService {
  static final String tag = '#webpageRepo';

  static WebpageRepo get singl => Get.find(tag: tag);
}
