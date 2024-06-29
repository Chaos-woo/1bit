
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class WalabagApi extends GetxService {
  static WalabagApi singl = Get.find();

  late DioApi _qClient;

  WalabagApi() {
    _qClient = DioApi('');
  }

  /// 获取文章列表
  void fetchArticleList() {

  }
}