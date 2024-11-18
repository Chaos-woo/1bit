import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:drift/drift.dart';

/// 数据库升级时的迁移接口
abstract class OnUpgradeMigration {
  /// 执行的数据库版本号
  int get execution_version;

  /// 迁移顺序
  int get execute_at => 0;

  /// 数据库升级时的操作
  Future<void> migrate(Migrator m, int from, int to, AppDatabase database);
}

/// 类名建议：Migration_Ver_X_At_N，其中X为版本号，N为迁移顺序
// class OnUpgradeMigration extends OnUpgradeMigration {
//   @override
//   int get execution_version => 1;
//
//   @override
//   Future<void> migrate(Migrator m, int from, int to, AppDatabase database) async {
//     m.addColumn(database.webpageReadingRecords, database.webpageReadingRecords.url);
//   }
// }
