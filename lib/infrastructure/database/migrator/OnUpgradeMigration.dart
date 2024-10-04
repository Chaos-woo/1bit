import 'package:cw2bit/infrastructure/database/ra1db.dart';
import 'package:drift/drift.dart';

/// 数据库升级时的迁移接口
abstract class OnUpgradeMigration {
  /// 接受的数据库版本号
  int get version;

  /// 迁移优先级，值越大优先级越低，默认值为0
  int get priority => 0;

  /// 数据库升级时的操作
  Future<void> migrate(Migrator m, int from, int to, AppDatabase database);
}

// class OnUpgradeMigrationExample extends OnUpgradeMigration {
//   @override
//   int get version => 1;
//
//   @override
//   Future<void> migrate(Migrator m, int from, int to, AppDatabase database) async {
//     m.addColumn(database.webpageReadingRecords, database.webpageReadingRecords.url);
//   }
// }
