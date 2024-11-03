import 'package:cw2bit/infrastructure/database/entity/r1db_import_mixin.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/infrastructure/database/r1db.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

/// 网页相关的仓库
final class WebpageRepo extends GetxService with R1DatabaseImportMixin {
  static final String tag = '#webpageRepo';

  static WebpageRepo get singl => Get.find(tag: tag);

  /// 根据ID获取网页阅读记录
  Future<WebpageReading?> get_reading_record_by_id(int id) async {
    var result = await (database.select(database.webpageReadings)
          ..where((t) => t.id.equals(id))
          ..limit(1))
        .get();
    return result.firstOrNull;
  }

  /// 获取所有网页阅读记录
  Future<List<WebpageReading>> list_all_reading_records() async {
    return await (database.select(database.webpageReadings)).get();
  }

  /// 是否存在指定网页阅读记录
  Future<WebpageReading?> get_reading_record(String url) async {
    var result = await (database.select(database.webpageReadings)
          ..where((t) => t.url.equals(url))
          ..limit(1))
        .get();
    return result.firstOrNull;
  }

  /// 添加网页阅读记录
  Future<int> add_reading_record(String url, {String? app}) async {
    var now = DateTime.now();
    return await database.into(database.webpageReadings).insert(WebpageReadingsCompanion(
          url: Value(url),
          create_time: Value(now),
          update_time: Value(now),
          app: Value(app ?? ''),
          reading_scroll_top: Value(0.0),
          reading_progress: Value(0.0),
          article_analysis: Value(''),
          source: Value(''),
        ));
  }

  /// 更新网页阅读记录的阅读进度和滚动条位置
  Future<void> update_reading_progress(int reading_record_id, double progress, double scrollTop) async {
    var now = DateTime.now();
    await (database.update(database.webpageReadings)..where((t) => t.id.equals(reading_record_id)))
        .write(WebpageReadingsCompanion(
      update_time: Value(now),
      reading_progress: Value(progress),
      reading_scroll_top: Value(scrollTop),
    ));
  }

  /// 更新网页阅读记录的更新时间
  Future<void> update_reading_update_time(String url) async {
    var now = DateTime.now();
    await (database.update(database.webpageReadings)..where((t) => t.url.equals(url))).write(WebpageReadingsCompanion(
      update_time: Value(now),
    ));
  }
}
