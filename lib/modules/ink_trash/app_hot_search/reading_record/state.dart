import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_webpage_reading_sticker.dart';

class ReadingRecordState {
  /// 全部列表
  final List<CombWebpageReadingSticker> all_webpages = [];

  /// 阅读中列表
  final List<CombWebpageReadingSticker> in_reading_webpages = [];

  /// 已归档列表
  final List<CombWebpageReadingSticker> archived_webpages = [];

  /// 收藏列表
  final List<CombWebpageReadingSticker> favorite_webpages = [];

  ReadingRecordState() {
    ///Initialize variables
  }

  /// 设置全部列表
  void set all_webpages(List<CombWebpageReadingSticker> value) {
    all_webpages.clear();
    all_webpages.addAll(value);
  }

  /// 设置阅读中列表
  void set in_reading_webpages(List<CombWebpageReadingSticker> value) {
    in_reading_webpages.clear();
    in_reading_webpages.addAll(value);
  }

  /// 设置已归档列表
  void set archived_webpages(List<CombWebpageReadingSticker> value) {
    archived_webpages.clear();
    archived_webpages.addAll(value);
  }

  /// 设置收藏列表
  void set favorite_webpages(List<CombWebpageReadingSticker> value) {
    favorite_webpages.clear();
    favorite_webpages.addAll(value);
  }
}
