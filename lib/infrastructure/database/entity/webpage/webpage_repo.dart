import 'package:cw2bit/infrastructure/database/entity/r1_database_import_mixin.dart';
import 'package:cw2bit/infrastructure/database/entity/tag/sticker.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_webpage_reading_sticker.dart';
import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

/// 网页相关的仓库
final class WebpageRepo extends GetxService with R1DatabaseMixin {
  static final String getx_tag = '__getx_webpage_repo__';

  static WebpageRepo get getx => Get.find(tag: getx_tag);

  /// 获取所有网页阅读记录及其关联的标签
  Future<List<CombWebpageReadingSticker>> list_all_reading_records_with_stickers() async {
    // 构建查询
    final query = database.select(t_webpage_readings).join([
      // 使用左连接来获取所有阅读记录，即使某些阅读记录没有关联的标签
      leftOuterJoin(t_webpage_reading_has_stickers,
          t_webpage_readings.id.equalsExp(t_webpage_reading_has_stickers.webpage_reading_id)),
      // 使用左连接来获取所有标签
      leftOuterJoin(t_stickers, t_stickers.id.equalsExp(t_webpage_reading_has_stickers.sticker_id)),
    ]);

    var webpage_with_stickers = <int, CombWebpageReadingSticker>{};
    var rows = await query.get();
    for (var row in rows) {
      // 提取阅读记录信息
      final webpage = row.readTable(t_webpage_readings);
      // 提取与当前阅读记录关联的标签
      final sticker = row.readTableOrNull(t_stickers);
      if (webpage_with_stickers.containsKey(webpage.id)) {
        var wws = webpage_with_stickers[webpage.id]!;
        if (sticker == null) {
          continue;
        }
        if (StickerType.is_type(sticker.sticker_type, StickerType.auto_generated)) {
          wws.generated_stickers.add(sticker);
        } else if (StickerType.is_type(sticker.sticker_type, StickerType.user_defined)) {
          wws.user_defined_sticker.add(sticker);
        }
      } else {
        var wws = CombWebpageReadingSticker(webpage_reading: webpage, generated_stickers: [], user_defined_sticker: []);
        webpage_with_stickers[webpage.id!] = wws;
        if (sticker == null) {
          continue;
        }
        if (StickerType.is_type(sticker.sticker_type, StickerType.auto_generated)) {
          wws.generated_stickers.add(sticker);
        } else if (StickerType.is_type(sticker.sticker_type, StickerType.user_defined)) {
          wws.user_defined_sticker.add(sticker);
        }
      }
    }

    return webpage_with_stickers.values.toList();
  }

  /// 根据ID获取网页阅读记录
  Future<WebpageReading?> get_reading_record_by_id(int reading_record_id) async {
    return await (database.select(database.webpageReadings)..where((t) => t.id.equals(reading_record_id)))
        .getSingleOrNull();
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
    String? source,
    List<Sticker> generated_stickers = const [],
    List<Sticker> user_defined_stickers = const [],
  }) async {
    var now = DateTime.now();
    int webpage_reading_id = await database.into(database.webpageReadings).insert(WebpageReadingsCompanion(
          url: Value(url),
          create_time: Value(now),
          update_time: Value(now),
          app: Value(app ?? ''),
          reading_scroll_top: Value(0.0),
          reading_progress: Value(0.0),
          article_analysis: Value(''),
          source: Value(source ?? ''),
          publish_time: Value(publish_time ?? now),
          author: Value(author ?? app ?? ''),
          title: Value(title ?? '无标题'),
          first_read_completed_time: Value(now),
          open_time_list: Value('${now.millisecondsSinceEpoch}'),
          is_collected: Value(false),
        ));

    var sticker_mapping = <int, Sticker>{};
    var new_stickers = [...generated_stickers, ...user_defined_stickers].where((s) => s.id == null).toList();
    [...generated_stickers, ...user_defined_stickers]
        .where((s) => s.id != null)
        .forEach((s) => sticker_mapping[s.id!] = s);

    if (new_stickers.isNotEmpty) {
      for (var sticker in new_stickers) {
        int sticker_id = await database.into(database.stickers).insert(StickersCompanion(
              name: Value(sticker.name),
              create_time: Value(sticker.create_time),
              update_time: Value(sticker.update_time),
              color: Value(sticker.color),
              font_color: Value(sticker.font_color),
              sign: Value(sticker.sign),
              sticker_type: Value(sticker.sticker_type),
              scope: Value(sticker.scope),
            ));
        sticker_mapping[sticker_id] = sticker;
      }
    }

    // 批量插入关联表
    if (sticker_mapping.isNotEmpty) {
      await database.transaction(() async {
        var batch_rels = sticker_mapping.entries
            .map((e) => WebpageReadingHasStickersCompanion(
                  create_time: Value(now),
                  update_time: Value(now),
                  webpage_reading_id: Value(webpage_reading_id),
                  sticker_id: Value(e.key),
                ))
            .toList();

        await database.delete(t_webpage_reading_has_stickers)
          ..where((t) => t.webpage_reading_id.equals(webpage_reading_id))
          ..go();

        await database.batch((batch) {
          batch.insertAll(
            t_webpage_reading_has_stickers,
            batch_rels,
            mode: InsertMode.insertOrReplace,
          );
        });
      });
    }

    return webpage_reading_id;
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
