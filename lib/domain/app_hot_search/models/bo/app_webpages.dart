import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';

/// 本地APP网页阅读记录
class LocalAppWebpages {
  final List<WebpageReading> webpages;

  LocalAppWebpages(this.webpages);

  WebpageReading? findWebpage(String url) {
    return webpages.where((element) => element.url == url).firstOrNull;
  }
}
