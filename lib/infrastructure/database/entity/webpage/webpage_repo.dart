import 'package:cw2bit/infrastructure/database/entity/r1_database_import_mixin.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

/// 网页相关的仓库
final class WebpageRepo extends GetxService with R1DatabaseMixin {
  static final String getx_tag = '__getx_webpage_repo__';

  static WebpageRepo get getx => Get.find(tag: getx_tag);

  /// 根据ID获取网页阅读记录
  Future<WebpageReading?> get_reading_record_by_id(int reading_record_id) async {
    var result = await (database.select(database.webpageReadings)
          ..where((t) => t.id.equals(reading_record_id))
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
  Future<int> add_reading_record(
    String url, {
    String? app,
    DateTime? publish_time,
    String? author,
    String? title,
    String? style_tags,
    String? custom_tags,
  }) async {
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
          publish_time: Value(publish_time ?? now),
          author: Value(author ?? app ?? ''),
          title: Value(title ?? '无标题'),
          first_read_completed_time: Value(null),
          open_time_list: Value('${now.millisecondsSinceEpoch}'),
          is_collected: Value(false),
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
    await (database.update(database.webpageReadings)..where((t) => t.url.equals(url))).write(
      WebpageReadingsCompanion(
        update_time: Value(now),
      ),
    );
  }

  /// 更新网页阅读记录的每次打开时间
  Future<void> update_reading_open_time(int reading_record_id, DateTime open_time) async {
    var now = DateTime.now();
    var record = await (database.select(database.webpageReadings)
          ..where((t) => t.id.equals(reading_record_id))
          ..limit(1))
        .getSingle();
    var open_time_list_str = record.open_time_list ?? '';
    if (open_time_list_str.isEmpty) {
      open_time_list_str = open_time.millisecondsSinceEpoch.toString();
    } else {
      open_time_list_str += (',${open_time.millisecondsSinceEpoch}');
    }
    await (database.update(database.webpageReadings)..where((t) => t.id.equals(reading_record_id)))
        .write(WebpageReadingsCompanion(
      update_time: Value(now),
      open_time_list: Value(open_time_list_str),
    ));
  }

  /// 更新网页阅读记录的文章风格标签
  Future<void> update_reading_style_tags(int reading_record_id, List<StickersCompanion> new_stickers) async {
    var now = DateTime.now();
    return await (database.transaction(() async {
      var new_sticker_ids = <int>[];

      if (new_stickers.isNotEmpty) {
        new_sticker_ids.addAll((await DatabaseMgr.repos.sticker.batch_add_stickers(new_stickers)).map((s) => s.id!));
      }

      if (new_sticker_ids.isNotEmpty) {
        await database.batch((batch) {
          batch.insertAll(
            database.webpageReadingHasStickers,
            [
              for (var sticker_id in new_sticker_ids)
                WebpageReadingHasStickersCompanion(
                  create_time: Value(now),
                  update_time: Value(now),
                  webpage_reading_id: Value(reading_record_id),
                  sticker_id: Value(sticker_id),
                ),
            ],
            mode: InsertMode.insertOrReplace,
          );
        });
      }
    }));
  }

  /// 更新网页阅读记录的自定义标签
  Future<void> update_reading_custom_tags(int reading_record_id, List<StickersCompanion> new_stickers) async {
    var now = DateTime.now();
    return await (database.transaction(() async {
      var new_sticker_ids = <int>[];

      if (new_stickers.isNotEmpty) {
        new_sticker_ids.addAll((await DatabaseMgr.repos.sticker.batch_add_stickers(new_stickers)).map((s) => s.id!));
      }

      if (new_sticker_ids.isNotEmpty) {
        await database.batch((batch) {
          batch.insertAll(
            database.webpageReadingHasStickers,
            [
              for (var sticker_id in new_sticker_ids)
                WebpageReadingHasStickersCompanion(
                  create_time: Value(now),
                  update_time: Value(now),
                  webpage_reading_id: Value(reading_record_id),
                  sticker_id: Value(sticker_id),
                ),
            ],
            mode: InsertMode.insertOrReplace,
          );
        });
      }
    }));
  }

  /// 更新网页阅读记录的收藏状态
  Future<void> update_reading_is_collected(int reading_record_id, bool is_collected) async {
    var now = DateTime.now();
    await (database.update(database.webpageReadings)..where((t) => t.id.equals(reading_record_id)))
        .write(WebpageReadingsCompanion(
      update_time: Value(now),
      is_collected: Value(is_collected),
    ));
  }

  /// 删除网页阅读记录
  Future<void> delete_reading_record(int reading_record_id) async {
    await (database.delete(database.webpageReadings)..where((t) => t.id.equals(reading_record_id))).go();
  }
}
