import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_repo.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/with_relation/hot_search_group_has_app.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/infrastructure/database/entity/with_relation/webpage_reading_has_sticker.dart';
import 'package:cw2bit/infrastructure/database/migrator/OnUpgradeMigration.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:get/get.dart' hide Value;

import 'entity/app_hot_search/hot_search_group.dart';
import 'entity/tag/sticker.dart';
import 'entity/tag/sticker_repo.dart';
import 'entity/webpage/webpage_repo.dart';

part 'r_database.g.dart';

/// 数据库管理器
final class DatabaseMgr {
  /// 数据库实例
  static AppDatabase get getx => Get.find(tag: AppDatabase.tag);

  /// 数据库仓库
  static _Repos get repos => _Repos.repo;

  DatabaseMgr._();

  /// ###
  /// ### 新增表在这里新增实例
  /// ###
  static void create_database_and_repository() {
    /// 初始化数据库
    Get.put(AppDatabase(), tag: AppDatabase.tag, permanent: true);

    /// 初始化仓库
    Get.put(StickerRepo(), tag: StickerRepo.getx_tag);
    Get.put(WebpageRepo(), tag: WebpageRepo.getx_tag);
    Get.put(HotSearchRepo(), tag: HotSearchRepo.getx_tag);
  }
}

final class _Repos {
  static final _Repos repo = _Repos._();

  _Repos._();

  /// ###
  /// ### 新增表在这里新增实例
  /// ###
  WebpageRepo get webpage => Get.find(tag: WebpageRepo.getx_tag);

  HotSearchRepo get hot_search => Get.find(tag: HotSearchRepo.getx_tag);

  StickerRepo get sticker => Get.find(tag: StickerRepo.getx_tag);
}

/// ###
/// ### 新增表在这里新增实例
/// ###
const _tables = [
  WebpageReadings,
  HotSearchApps,
  HotSearchGroups,
  HotSearchGroupHasApps,
  Stickers,
  WebpageReadingHasStickers,
];

/// 数据库迁移器，每次新加迁移器需要在此处理
const List<OnUpgradeMigration> _migrators = [];

const db_name = 'cribi.db';

@DriftDatabase()
class AppDatabase extends _$AppDatabase {
  static const String tag = '__getx_app_database__';

  AppDatabase() : super(_open_connection());

  int get schemaVersion => 1;

  static _open_connection() {
    return driftDatabase(name: db_name);
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          var migrators = <int, List<OnUpgradeMigration>>{};
          for (var migrator in _migrators) {
            migrators[migrator.execution_version] = (migrators[migrator.execution_version] ?? [])..add(migrator);
          }

          var migrators_entries = migrators.entries.toList();

          /// 按版本号升序排序
          migrators_entries.sort((a, b) => a.key.compareTo(b.key));

          for (var entry in migrators_entries) {
            if (from < entry.key) {
              var current_version_migrators = entry.value;

              /// 按照顺序排序
              current_version_migrators.sort((a, b) => a.execute_at.compareTo(b.execute_at));
              for (var migrator in current_version_migrators) {
                await migrator.migrate(m, from, to, this);
              }
            }
          }
        },
      );
}
