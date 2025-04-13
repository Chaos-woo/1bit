import 'package:cw2bit/modules/b_database_drift/migrator/migrations.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:get/get.dart' hide Value;

import 'migrator/OnUpgradeMigration.dart';

/// 数据库管理器
final class DatabaseMgr {
  /// 数据库实例
  static AppDatabase get getx => Get.find(tag: AppDatabase.mGetxTag);

  DatabaseMgr._();

  /// ###
  /// ### 新增表在这里新增实例
  /// ###
  static void initialDatabase() {
    /// 初始化数据库
    Get.put(AppDatabase(), tag: AppDatabase.mGetxTag, permanent: true);

    /// 初始化仓库管理器
    Get.put(RepositoryMgr(), tag: RepositoryMgr.mGetxTag, permanent: true);

    /// 初始化仓库
    Get.put(StickerRepo(), tag: StickerRepo.getx_tag);
    Get.put(WebpageRepo(), tag: WebpageRepo.getx_tag);
    Get.put(HotSearchRepo(), tag: HotSearchRepo._getxTag);
  }
}

final class RepositoryMgr {
  static const String mGetxTag = '__getx_repository_mgr__';

  static RepositoryMgr get getx => Get.find(tag: RepositoryMgr.mGetxTag);

  /// ###
  /// ### 新增表在这里新增实例
  /// ###
  WebpageRepo get webpage => WebpageRepo.getx;

  HotSearchRepo get hot_search => HotSearchRepo.getx;

  StickerRepo get sticker => StickerRepo.getx;
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

const databaseFilename = 'ink_database.db';

@DriftDatabase()
class AppDatabase extends _$AppDatabase {
  static const String mGetxTag = '__getx_app_database__';

  AppDatabase() : super(_openConnection());

  int get schemaVersion => 1;

  static _openConnection() {
    return driftDatabase(name: databaseFilename);
  }

  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          var migrators = <int, List<OnUpgradeMigration>>{};
          for (var migrator in AppDataMigration.migrators) {
            migrators[migrator.executeVersion] = (migrators[migrator.executeVersion] ?? [])..add(migrator);
          }

          var migratorsEntries = migrators.entries.toList();

          /// 按版本号升序排序
          migratorsEntries.sort((a, b) => a.key.compareTo(b.key));

          for (var entry in migratorsEntries) {
            if (from < entry.key) {
              var currentVersionMigrators = entry.value;

              /// 按照顺序排序
              currentVersionMigrators.sort((a, b) => a.executeOrder.compareTo(b.executeOrder));
              for (var migrator in currentVersionMigrators) {
                await migrator.migrate(m, from, to, this);
              }
            }
          }
        },
      );
}
