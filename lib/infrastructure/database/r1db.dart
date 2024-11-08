import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_repo.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/infrastructure/database/migrator/OnUpgradeMigration.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:get/get.dart' hide Value;

import 'entity/webpage/webpage_repo.dart';

part 'r1db.g.dart';

/// 数据库管理器
final class R1DatabaseMgr {
  /// 数据库实例
  static AppDatabase get singl => Get.find(tag: AppDatabase.tag);

  /// 数据库仓库
  static _Repos get repos => _Repos.singl;

  R1DatabaseMgr._();

  static void createDatabaseAndRepositories() {
    /// 初始化数据库
    Get.put(AppDatabase(), tag: AppDatabase.tag, permanent: true);

    /// 初始化仓库
    Get.put(WebpageRepo(), tag: WebpageRepo.tag);
    Get.put(HotSearchRepo(), tag: HotSearchRepo.tag);
  }
}

final class _Repos {
  static final _Repos singl = _Repos._();

  _Repos._();

  WebpageRepo get webpage => Get.find(tag: WebpageRepo.tag);

  HotSearchRepo get hotSearch => Get.find(tag: HotSearchRepo.tag);
}

/// 数据库表，每次新加表需要在此处理
const _tables = [
  WebpageReadings,
  FavoriteApps,
  FavoriteAppGroups,
];

/// 数据库迁移器，每次新加迁移器需要在此处理
const List<OnUpgradeMigration> _migrators = [];

const db_name = 'c_r1bit_db.db';

@DriftDatabase(tables: _tables)
class AppDatabase extends _$AppDatabase {
  static const String tag = '#appDatabase';

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static _openConnection() {
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
            migrators[migrator.version] = (migrators[migrator.version] ?? [])..add(migrator);
          }

          var migrators_entries = migrators.entries.toList();

          /// 按版本号升序排序
          migrators_entries.sort((a, b) => a.key.compareTo(b.key));

          for (var entry in migrators_entries) {
            if (from < entry.key) {
              var current_version_migrators = entry.value;

              /// 按优先级升序排序
              current_version_migrators.sort((a, b) => a.priority.compareTo(b.priority));
              for (var migrator in current_version_migrators) {
                await migrator.migrate(m, from, to, this);
              }
            }
          }
        },
      );
}
