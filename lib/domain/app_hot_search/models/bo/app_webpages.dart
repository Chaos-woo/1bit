import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';

/// 本地APP网页阅读记录
class LocalAppWebpages {
  final List<WebpageReading> webpages;

  LocalAppWebpages(this.webpages);

  void replaceWebpage(WebpageReading webpage) {
    final index = webpages.indexWhere((element) => element.url == webpage.url);
    if (index == -1) {
      webpages.add(webpage);
    } else {
      webpages[index] = webpage;
    }
  }

  WebpageReading? findWebpage(String url) {
    return webpages.where((element) => element.url == url).firstOrNull;
  }
}
